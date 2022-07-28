//
//  CommonActions.m
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import "CommonActions.h"
#import "XCUIElement+Shortcut.h"
#import "PagesManager.h"
#import "PredicateHelper.h"
#import "Constants.h"
#import "BillRecord.h"
#import "BillEntryPage.h"

@implementation CommonActions

+ (void)hideKeyboardIfPresent {
    [[[[[[[XCUIApplication new] toolbars] firstMatch] otherElements] buttons] elementMatchingPredicate:LABEL_EQUALS(@"Done")] waitAndTapIfExists];
}


+ (BOOL)enterRecordDetailsAndCalculate:(BillRecord *)record {
    
    NSString *billAmt = [NSString stringWithFormat:@"%.2f",record.billAmt];
    bool detailsEntered = [PagesManager.sharedInstance.billEntryPage enterTotalBillAmt:billAmt];
    detailsEntered &= [PagesManager.sharedInstance.billEntryPage setPeopleCount:record.numPeople];
    detailsEntered &= [PagesManager.sharedInstance.billEntryPage.sectionTipSelection setTipPercentage:record.tipPercentage];
    [CommonActions hideKeyboardIfPresent];
    detailsEntered &= [PagesManager.sharedInstance.billEntryPage.buttonCalculate waitAndTap];
    return detailsEntered;
}



@end
