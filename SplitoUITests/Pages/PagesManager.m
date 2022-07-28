//
//  PagesManager.m
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import "PagesManager.h"
#import "BillEntryScreen/BillEntryPage.h"
#import "BillHistoryScreen/BillHistoryPage.h"

@implementation PagesManager

+ (instancetype)sharedInstance {
    static PagesManager *sharedInstance = nil;
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    }
    return sharedInstance;
}


- (instancetype)init {
    self = [super init];
    self.billEntryPage = [BillEntryPage new];
    self.billHistoryPage = [BillHistoryPage new];
    return self;
}


@end
