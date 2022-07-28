//
//  DataGenerator.h
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import <Foundation/Foundation.h>

@interface DataGenerator : NSObject


/**
 * Returns random integer for the given range
 *
 * @param lowerBound the lower bound for the int range
 * @param upperBound the upper bound for the int range
 * @return A randomly generated integer for the given range
 */
+ (int)getRandomInt:(int)lowerBound
      andUpperBound:(int)upperBound;


@end
