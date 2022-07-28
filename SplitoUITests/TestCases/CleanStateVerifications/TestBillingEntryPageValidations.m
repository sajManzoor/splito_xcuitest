//
//  TestFreshInstallVerifications.m
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//


#import "BaseCase.h"
#import "BillEntryPage.h"
#import "BillHistoryPage.h"
#import "CommonActions.h"

@interface TestBillingEntryPageValidations : BaseCase

/*
 * The exceeded bill input amount.
 */
@property NSString *billExceedingLimit;

@end

@implementation TestBillingEntryPageValidations

- (void)setUp {
    self.needCleanState = YES;
    [super setUp];
    int billExceedingLimitAmt = BILL_INPUT_LIMIT + [DataGenerator getRandomInt:1 andUpperBound:100];
    self.billExceedingLimit = [NSString stringWithFormat:@"%d",billExceedingLimitAmt];
}

// Scenario 1 Part 1 - Verify that in Bill Entering Screen user cannot enter bill more than 10000.
- (void)testExceedBillLimit {
    
    //enter input and check if valid
    XCTAssertTrue([PagesManager.sharedInstance.billEntryPage enterTotalBillAmt:self.billExceedingLimit]);
    [CommonActions hideKeyboardIfPresent];
    
    XCTAssertTrue([PagesManager.sharedInstance.billEntryPage.buttonCalculate waitAndTap]);
    XCTAssertTrue([PagesManager.sharedInstance.billEntryPage.labelErrorAlert existsWithWait]);
    XCTAssertEqualObjects([PagesManager.sharedInstance.billEntryPage.labelErrorAlertMsg label], LABEL_BILL_EXCEED_MSG);
    XCTAssertTrue([PagesManager.sharedInstance.billEntryPage.buttonAlertOK waitAndTap]);
    
    // make sure the total bill amount is still 0
    XCTAssertEqualObjects([PagesManager.sharedInstance.billEntryPage.labelTotalBillAmountPerPerson label], @"0");
    
    // make sure the view bill history page has no entries after performing the above scenario
    XCTAssertTrue([PagesManager.sharedInstance.billEntryPage.buttonViewBillHistory waitAndTap]);
    XCTAssertTrue([PagesManager.sharedInstance.billHistoryPage.progressBar waitForDisappearence]);
    XCTAssertTrue([PagesManager.sharedInstance.billHistoryPage checkIfMandatoryComponentsExist]);
    XCTAssertEqualObjects([PagesManager.sharedInstance.billHistoryPage.tableViewBillingRecordList label], LABEL_EMPTY_LIST);
    XCTAssertTrue(PagesManager.sharedInstance.billHistoryPage.tableViewBillingRecordList.cells.count == 0);
    XCTAssertTrue([PagesManager.sharedInstance.billHistoryPage.imageNoData existsWithWait]);
    XCTAssertTrue([PagesManager.sharedInstance.billHistoryPage.labelNoData existsWithWait]);
}

- (void)tearDown {
    [super tearDown];
}

@end
