//
//  BillRecord.h
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import "Page.h"

@interface BillRecord : Page

/*
 * The total final bill amount per person.
 */
@property NSString *totalBillAmt;

/*
 * The initial total bill amount
 */
@property double billAmt;

/*
 * The final bill amt without rounding off.
 */
@property double rawTotalBillAmt;

/*
 * The total num of people the bill is being spillted with.
 */
@property int numPeople;

/*
 * The tip percentage selected.
 */
@property float tipPercentage;


- (instancetype) initRecordWithBillAmt:(double)billAmt
                        andNumOfPeople:(int)numPeople
                      andTipPercentage:(double)tipPercentage;

@end

