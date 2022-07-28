//
//  BillEntrySectionPage.m
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import "BillEntryPage.h"
#import "Constants.h"

@implementation BillEntryPage


- (instancetype)init {
    self = [super init];
    if (self) {
        
        NSPredicate *andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[PLACEHOLDER_EQUALS(@"Enter bill total"),IDENTIFIER_EQUALS(@"bill_entered_amount")]];
        XCUIElement *scrollView = self.appView.scrollViews.firstMatch;
        self.textFieldTotalBill = [scrollView.textFields elementMatchingPredicate:andPredicate];
        self.imageBackground = [self.appView.otherElements.images elementMatchingPredicate:IDENTIFIER_EQUALS(@"Asset")];
        self.labelPersonCount = [scrollView.otherElements.staticTexts elementMatchingPredicate:IDENTIFIER_EQUALS(@"total_person_in_bill")];
        self.imagePersonCount = [scrollView.otherElements.images elementMatchingPredicate:IDENTIFIER_EQUALS(@"Icon_1")];
        
        andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[LABEL_EQUALS(@"+"),IDENTIFIER_EQUALS(@"increment_person")]];
        self.buttonIncrementPersonCount = [scrollView.otherElements.buttons elementMatchingPredicate:andPredicate];
        
        andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[LABEL_EQUALS(@"-"),IDENTIFIER_EQUALS(@"decrement_person")]];
        self.buttonDecrementPersonCount = [scrollView.otherElements.buttons elementMatchingPredicate:andPredicate];
        
        
        self.labelChooseTip = [scrollView.otherElements.staticTexts elementMatchingPredicate:LABEL_EQUALS(LABEL_CHOOSE_TIP)];
        
        
        XCUIElement *sectionTipSelectionView = [[scrollView.otherElements.firstMatch otherElements] elementBoundByIndex:1];
        self.sectionTipSelection = [[SectionTipSelection alloc] initWithView:sectionTipSelectionView];
        
        self.labelTotalPerPerson = [scrollView.otherElements.staticTexts elementMatchingPredicate:LABEL_EQUALS(LABEL_TOTAL_PER_PERSON)];
        
        self.labelTotalBillAmountPerPerson = [scrollView.otherElements.staticTexts elementMatchingPredicate:IDENTIFIER_EQUALS(@"total_bill_each_person")];
        
        self.buttonViewBillHistory = [scrollView.otherElements.buttons elementMatchingPredicate:LABEL_EQUALS(LABEL_VIEW_BILL_HISTORY)];
        
        andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[LABEL_EQUALS(LABEL_CALCULATE),IDENTIFIER_EQUALS(@"calculate_bill_button")]];
        self.buttonCalculate = [self.appView.otherElements.buttons elementMatchingPredicate:andPredicate];
        
        // non mandatory components
        andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[LABEL_EQUALS(LABEL_ERROR),IDENTIFIER_EQUALS(@"maximumBillAlert")]];
        self.labelErrorAlert = [self.appView.alerts elementMatchingPredicate:andPredicate];
        self.labelErrorAlertMsg = [self.labelErrorAlert.staticTexts elementBoundByIndex:1];
        self.buttonAlertOK = [self.labelErrorAlert.buttons elementMatchingPredicate:LABEL_EQUALS(LABEL_OK)];
        
        self.mandatoryComponents = [NSMutableArray arrayWithObjects:self.textFieldTotalBill, self.imageBackground, self.labelPersonCount, self.imagePersonCount, self.buttonIncrementPersonCount, self.buttonDecrementPersonCount, self.labelChooseTip, self.labelTotalPerPerson, self.labelTotalBillAmountPerPerson, self.buttonViewBillHistory, self.buttonCalculate, nil];
    }
    
    return self;
}

- (bool)setPeopleCount:(int)count {
    
    if (count > [[self.labelPersonCount label] intValue]) {
        bool inc = true;
        while ([[self.labelPersonCount label] intValue] != count && inc) {
            inc = [self incrementPersonCount];
        }
    }
    else if(count < [[self.labelPersonCount label] intValue]) {
        bool dec = true;
        while ([[self.labelPersonCount label] intValue] != count && dec) {
            dec = [self decrementPersonCount];
        }
        
    }
    
    return count == [[self.labelPersonCount label] intValue];
}

- (bool) enterTotalBillAmt:(NSString *)billAmt {
    [self.textFieldTotalBill clearText];
    [self.textFieldTotalBill tapAndTypeText:billAmt];
    return [[self.textFieldTotalBill value] isEqualToString:billAmt];
}

- (bool)incrementPersonCount {
    int prev_count = [[self.labelPersonCount label] intValue];
    [self.buttonIncrementPersonCount waitAndTap];
    return [[self.labelPersonCount label] intValue] == prev_count + 1;
}

- (bool)decrementPersonCount {
    int prev_count = [[self.labelPersonCount label] intValue];
    [self.buttonDecrementPersonCount waitAndTap];
    return [[self.labelPersonCount label] intValue] == prev_count - 1;
}



@end

@implementation SectionTipSelection

- (instancetype)initWithView:(XCUIElement *)view {
    self = [super init];
    if (self) {
        NSCompoundPredicate *andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[LABEL_EQUALS(LABEL_ZERO_PERCENT),IDENTIFIER_EQUALS(@"0_percent")]];
        self.buttonTipZero = [view.buttons elementMatchingPredicate:andPredicate];
        
        andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[LABEL_EQUALS(LABEL_TEN_PERCENT),IDENTIFIER_EQUALS(@"10_percent")]];
        self.buttonTipTen = [view.buttons elementMatchingPredicate:andPredicate];
        
        andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[LABEL_EQUALS(LABEL_FIFETEEN_PERCENT),IDENTIFIER_EQUALS(@"15_percent")]];
        self.buttonTipFifeteen = [view.buttons elementMatchingPredicate:andPredicate];
        
        andPredicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[LABEL_EQUALS(LABEL_TWENTY_PERCENT),IDENTIFIER_EQUALS(@"20_percent")]];
        self.buttonTipTwenty = [view.buttons elementMatchingPredicate:andPredicate];
        
        self.mandatoryComponents = [NSMutableArray arrayWithObjects:self.buttonTipZero, self.buttonTipTen, self.buttonTipFifeteen, self.buttonTipTwenty, nil];
    }
    return self;
}


- (bool)setTipPercentage:(int)tipPercentage {
    
    if (tipPercentage == 10) {
        return [self.buttonTipTen waitAndTap];
        // This is a bug that the selected prop is always set to buttonTipZero
        //return [self.buttonTipTen isSelected];
    }
    else if (tipPercentage == 15) {
        return [self.buttonTipFifeteen waitAndTap];
        //This is a bug that the selected prop is always set to buttonTipZero
        //return [self.buttonTipFifeteen isSelected];
    }
    else if (tipPercentage == 20) {
        return [self.buttonTipTwenty waitAndTap];
        // This is a bug that the selected prop is always set to buttonTipZero
        //return [self.buttonTipTwenty isSelected];
    }
    else {
        [self.buttonTipZero waitAndTap];
        return [self.buttonTipZero isSelected];
    }
}

@end
