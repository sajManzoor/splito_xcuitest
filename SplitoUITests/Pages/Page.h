//
//  Page.h
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "XCUIElement+Shortcut.h"
#import "PredicateHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface Page : NSObject

/*
 * An array to store the mandatoryComponents of a page.
 */
@property NSMutableArray *mandatoryComponents;


/*
 * return XCUIApplication instance.
 */
- (XCUIApplication *)appView;


/*
 * checks if all mandatory components of a page exist.
 */
- (bool) checkIfMandatoryComponentsExist;

/*
 * checks if all mandatory components of a page exists with a timeout in place.
 */
- (bool) checkIfMandatoryComponentsExistWithTimeout:(int)timeOut;


@end

NS_ASSUME_NONNULL_END
