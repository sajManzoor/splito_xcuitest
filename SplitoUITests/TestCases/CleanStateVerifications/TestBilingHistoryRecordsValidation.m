//
//  TestBilingHistoryRecordsValidation.m
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//


#import "BaseCase.h"
#import "BillEntryPage.h"
#import "BillHistoryPage.h"
#import "CommonActions.h"
#import "BillRecord.h"

#define ZERO 0

@interface TestBilingHistoryRecordsValidation : BaseCase

@property NSMutableArray<BillRecord *> *billRecords;

@end

@implementation TestBilingHistoryRecordsValidation

#define RECORD_COUNT 10

- (void)setUp {
    self.needCleanState = YES;
    [super setUp];
    self.billRecords = [self generateRecordDataForCount:RECORD_COUNT];
    
    //validate setup data count
    XCTAssertTrue(self.billRecords.count == RECORD_COUNT);
}

// Scenario 2 - Verify Billing Records and Billing history Labels
- (void) testVerifyBillingRecords {
    
    // scenario 2 - part 1 - enter records
    for (BillRecord *record in self.billRecords) {
        XCTAssertTrue([CommonActions enterRecordDetailsAndCalculate:record]);
        bool verifyBillPerPerson = [PagesManager.sharedInstance.billEntryPage.labelTotalBillAmountPerPerson waitForElementPredicate:LABEL_EQUALS(record.totalBillAmt) withTimeOut:MEDIUM_WAIT_TIME];
        XCTAssertTrue(verifyBillPerPerson);
    }
    
    // scenario 2 - part 2 - once records are entered, navigate to billHistoryPage
    XCTAssertTrue([PagesManager.sharedInstance.billEntryPage.buttonViewBillHistory waitAndTap]);
    XCTAssertTrue([PagesManager.sharedInstance.billHistoryPage.progressBar waitForDisappearence]);
    XCTAssertTrue([PagesManager.sharedInstance.billHistoryPage checkIfMandatoryComponentsExist]);
    
    // validate the records
    XCTAssertTrue(PagesManager.sharedInstance.billHistoryPage.cellsBillingHistory.count == RECORD_COUNT);
    __block double totalBillHistoryAmt = 0.0;
    __block int totalHistoryPpl = 0;
    [[PagesManager.sharedInstance.billHistoryPage.cellsBillingHistory.staticTexts allElementsBoundByIndex] enumerateObjectsUsingBlock:^(XCUIElement *obj, NSUInteger idx, BOOL *stop) {
        NSString *expectedCellContent = [NSString stringWithFormat:@"Sr. %lu | %@",(unsigned long)idx+1,self.billRecords[idx]];
        XCTAssertEqualObjects([obj label], expectedCellContent);
        totalBillHistoryAmt+=self.billRecords[idx].rawTotalBillAmt;
        totalHistoryPpl+=self.billRecords[idx].numPeople;
        }];
    
    // scenario 2 - part 3 - check the total ppl and total bill labels.
    NSString *expectedPeopleCount = [NSString stringWithFormat:@"%@%d ",TOTAL_PEOPLE_PREFIX,totalHistoryPpl];
    XCTAssertEqualObjects([PagesManager.sharedInstance.billHistoryPage.labelNumPeople label], expectedPeopleCount);
    NSString *exptectedTotalBillHistoryAmt = [NSString stringWithFormat:@"%@%0.2f",TOTAL_BILL_PREFIX,totalBillHistoryAmt];
    XCTAssertEqualObjects([PagesManager.sharedInstance.billHistoryPage.labelTotalBill label], exptectedTotalBillHistoryAmt);
}

- (void)tearDown {
    [super tearDown];
}

@end

