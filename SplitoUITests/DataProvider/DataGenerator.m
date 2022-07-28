//
//  DataGenerator.m
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import "DataGenerator.h"

@implementation DataGenerator

+ (int)getRandomInt:(int)lowerBound
      andUpperBound:(int)upperBound {
    return lowerBound + arc4random() % (upperBound - lowerBound);
}


@end
