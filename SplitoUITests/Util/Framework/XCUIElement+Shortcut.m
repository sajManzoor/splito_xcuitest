//
//  XCUIElement+Shortcut.m
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import "XCUIElement+Shortcut.h"
#import "Constants.h"

@implementation XCUIElement (Shortcut)

- (BOOL)existsWithWait {
    return self.exists || [self waitForExistenceWithTimeout:DEFAULT_WAIT_TIME];
}


- (BOOL)waitAndTap {
    return [self waitAndTapWithTimeout:DEFAULT_WAIT_TIME];
}

- (BOOL)waitAndTapWithTimeout:(int)timeout {
    BOOL elementExists = [self waitForExistenceWithTimeout:timeout];
    if (elementExists) {
        [self tap];
    }
    return elementExists;
}

- (void)clearText {
    if (![self.value isKindOfClass:NSString.class]) return;
    if ([self.value length] == 0) return;
    if ([self.value isEqualToString:self.placeholderValue]) return;

    [self doubleTap];
    [[XCUIApplication new]/*@START_MENU_TOKEN@*/.staticTexts[@"Cut"]/*[[".menus",".menuItems[@\"Cut\"].staticTexts[@\"Cut\"]",".staticTexts[@\"Cut\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/ tap];
}

- (void)tapAndTypeText:(NSString *)text {
    [self waitAndTap];
    [self typeText:text];
}

- (void)waitAndTapIfExists {
    [self waitAndTapWithTimeout:DEFAULT_WAIT_TIME];
}

- (BOOL)waitForDisappearence {
    if (self.exists) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"exists == 0"];

        XCTNSPredicateExpectation *expectation = [[XCTNSPredicateExpectation alloc]
                                                  initWithPredicate:predicate object:self];
        
        XCTWaiterResult result = [XCTWaiter waitForExpectations:[NSArray arrayWithObject:expectation]
                                                        timeout:MEDIUM_WAIT_TIME];

        return result == XCTWaiterResultCompleted;
    }
    else {
        return true;
    }
}

- (BOOL)waitForElementPredicate:(NSPredicate *)predicate withTimeOut:(int)timeout {
    XCTNSPredicateExpectation *expectation = [[XCTNSPredicateExpectation alloc]
                                              initWithPredicate:predicate object:self];

    XCTWaiterResult result = [XCTWaiter waitForExpectations:[NSArray arrayWithObject:expectation]
                                                    timeout:timeout];
    
    return result == XCTWaiterResultCompleted;
}

@end
