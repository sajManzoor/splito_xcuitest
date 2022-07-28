//
//  BaseCase.m
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import "BaseCase.h"
#import "BillEntryPage.h"
#import "BillHistoryPage.h"
#import "BillRecord.h"


@implementation BaseCase

- (void) setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    if (self.needCleanState) {
        [app setLaunchArguments:@[@"--clearData"]];
    }
    [app launch];
    
    NSDictionary *environment = [[NSProcessInfo processInfo] environment];
    self.tipPercentage = [environment[@"tip_value"] doubleValue];
    
    //check that all mandatory components for the bill entry page exist.
    XCTAssertTrue([PagesManager.sharedInstance.billEntryPage checkIfMandatoryComponentsExist]);
    XCTAssertTrue([PagesManager.sharedInstance.billEntryPage.sectionTipSelection checkIfMandatoryComponentsExist]);
}


- (NSMutableArray<BillRecord *> *) generateRecordDataForCount:(int)count {
    NSMutableArray<BillRecord *> *billRecords = [NSMutableArray new];
    for (int i = 0; i < count; i++) {
        double billAmt = [DataGenerator getRandomInt:150 andUpperBound:500];
        double numPeople = [DataGenerator getRandomInt:2 andUpperBound:5];
        BillRecord *record = [[BillRecord alloc] initRecordWithBillAmt:billAmt andNumOfPeople:numPeople andTipPercentage:self.tipPercentage];
        [billRecords addObject:record];
    }
    return billRecords;
}


- (void)tearDown {
    [super tearDown];
}


@end
