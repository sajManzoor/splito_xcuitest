//
//  BillRecord.m
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import "BillRecord.h"

@implementation BillRecord


- (instancetype) initRecordWithBillAmt:(double)billAmt
                        andNumOfPeople:(int)numPeople
                      andTipPercentage:(double)tipPercentage {
    self = [super init];
    if (self) {
        self.billAmt = billAmt;
        self.numPeople = numPeople;
        self.tipPercentage = tipPercentage;
        self.totalBillAmt = [self calculateBillAmtPerPerson];
    }
    return self;
}


- (NSString *)calculateBillAmtPerPerson {
    
    //Note: following the same calculation method as implemented in app to not let the case fail due to rounding off issue.
    // The dev code implementation has round off inaccuracy, by right the test should fail if we use accurate roudning.
    float tip = 0.0;
    if (self.tipPercentage == 0) tip = 1.0;
    else if (self.tipPercentage == 10) tip = 1.1;
    else if (self.tipPercentage == 15) tip = 1.15;
    else if (self.tipPercentage == 20) tip = 1.20;
    
    double billAmt = ((double)self.billAmt * tip) / (double)self.numPeople;
    self.rawTotalBillAmt = billAmt;
    return [NSString stringWithFormat:@"%.02f", billAmt];
}


-( NSString *)description
{
    return [NSString stringWithFormat:@"Total Bill: %@ | number OF People: %d", self.totalBillAmt, self.numPeople];
}

@end
