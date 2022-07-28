//
//  PagesManager.h
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import <Foundation/Foundation.h>


@class BillEntryPage;
@class BillHistoryPage;


@interface PagesManager : NSObject

@property BillEntryPage *billEntryPage;

@property BillHistoryPage *billHistoryPage;


+ (instancetype)sharedInstance;

@end

