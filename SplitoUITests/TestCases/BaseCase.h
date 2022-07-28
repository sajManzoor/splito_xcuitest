//
//  BaseCase.h
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import "Page.h"
#import "XCTest/XCTestCase.h"
#import "PagesManager.h"
#import "DataGenerator.h"
#import "Constants.h"

@class BillRecord;

@interface BaseCase : XCTestCase

/*
 * A flag to determine if the app should be launched with clean state.
 */
@property bool needCleanState;

@property double tipPercentage;

- (NSMutableArray<BillRecord *> *) generateRecordDataForCount:(int)count;

@end
