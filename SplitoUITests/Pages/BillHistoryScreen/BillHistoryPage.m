//
//  BillHistoryScreen.m
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import "BillHistoryPage.h"
#import "Constants.h"

@implementation BillHistoryPage

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.progressBar = self.appView.activityIndicators.firstMatch;
        self.labelNumPeople = [self.appView.otherElements.staticTexts elementMatchingPredicate:IDENTIFIER_EQUALS(@"numberOfPeople")];
        self.labelTotalBill = [self.appView.otherElements.staticTexts elementMatchingPredicate:IDENTIFIER_EQUALS(@"totalBill")];
        self.imageNoData = [self.appView.otherElements.images elementMatchingPredicate:IDENTIFIER_EQUALS(@"questionmark.folder.fill")];
        self.labelNoData = [self.appView.otherElements.staticTexts elementMatchingPredicate:LABEL_EQUALS(LABEL_NO_DATA)];
        self.tableViewBillingRecordList = [self.appView.otherElements.tables elementMatchingPredicate:IDENTIFIER_EQUALS(@"billHistoryTableView")];
        self.cellsBillingHistory = self.tableViewBillingRecordList.cells;
        
        self.mandatoryComponents = [NSMutableArray arrayWithObjects:self.labelNumPeople, self.labelTotalBill, self.tableViewBillingRecordList, nil];
    }
    
    return self;
}

@end
