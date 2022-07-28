//
//  TestBillingHistoryPageValidations.m
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//


#import "BaseCase.h"
#import "BillEntryPage.h"
#import "BillHistoryPage.h"
#import "CommonActions.h"

#define ZERO 0

@interface TestBillingHistoryPageValidations : BaseCase

@end

@implementation TestBillingHistoryPageValidations

- (void)setUp {
    self.needCleanState = YES;
    [super setUp];
    
    // make sure the view bill history page has no entries after performing the above scenario
    XCTAssertTrue([PagesManager.sharedInstance.billEntryPage.buttonViewBillHistory waitAndTap]);
    XCTAssertTrue([PagesManager.sharedInstance.billHistoryPage.progressBar waitForDisappearence]);
    XCTAssertTrue([PagesManager.sharedInstance.billHistoryPage checkIfMandatoryComponentsExist]);
}

// Scenario 1 Part 2 - Verify that in View Bill History Screen there is no record.
- (void) testVerifyNoBillingRecords {
    
    XCTAssertEqualObjects([PagesManager.sharedInstance.billHistoryPage.tableViewBillingRecordList label], LABEL_EMPTY_LIST);
    XCTAssertTrue(PagesManager.sharedInstance.billHistoryPage.tableViewBillingRecordList.cells.count == 0);
    XCTAssertTrue([PagesManager.sharedInstance.billHistoryPage.imageNoData existsWithWait]);
    XCTAssertTrue([PagesManager.sharedInstance.billHistoryPage.labelNoData existsWithWait]);
}

// Scenario 1 Part 3 - Veirfy that in View Bill History Screen that total number of people is 0 by default.
- (void) testVerifyTotalNumPeople {
    
    NSString *totalPeopleLabel = [NSString stringWithFormat:@"%@%d ",TOTAL_PEOPLE_PREFIX,ZERO];
    XCTAssertEqualObjects([PagesManager.sharedInstance.billHistoryPage.labelNumPeople label], totalPeopleLabel);
    
}

// Scenario 1 Part 4 - Verify that in View Bill History screen that total bill is 0.00 by default.
- (void) testVerifyTotalBillAmt {
    
    NSString* formattedNumber = [NSString stringWithFormat:@"%.2f", ZERO];
    NSString *totalBillAmtLabel = [NSString stringWithFormat:@"%@%@",TOTAL_BILL_PREFIX,formattedNumber];
    XCTAssertEqualObjects([PagesManager.sharedInstance.billHistoryPage.labelTotalBill label], totalBillAmtLabel);
    
}


- (void)tearDown {
    [super tearDown];
}

@end
