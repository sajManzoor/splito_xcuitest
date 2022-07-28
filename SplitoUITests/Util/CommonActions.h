//
//  CommonActions.h
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import <Foundation/Foundation.h>

@class BillRecord;


@interface CommonActions : NSObject

/*
 * A method to hide keyboard if its present
 */
+ (void)hideKeyboardIfPresent;


/*
 * A common method to enter record details in the bill entry page.
 */
+ (BOOL)enterRecordDetailsAndCalculate:(BillRecord *)record;

@end

