//
//  BillEntrySectionPage.h
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import "Page.h"

@class SectionTipSelection;

@interface BillEntryPage : Page

/*
 * A text field that is located on the top section of the bill entry page above the
 * person count increment buttons.
 * It is used to input the total bill about.
 */
@property XCUIElement *textFieldTotalBill;


/*
 * This is the background image of the Bill Entry page.
 */
@property XCUIElement *imageBackground;


/*
 * A static text that display the total person count and is located to the left of the increment buttons.
 */
@property XCUIElement *labelPersonCount;

/*
 * The person icon image displayed to the left of the person count label.
 */
@property XCUIElement *imagePersonCount;


/*
 * The button located to the right of the person count label.
 * It is used to increment the number of people the bill is splitted with.
 */
@property XCUIElement *buttonIncrementPersonCount;


/*
 * The button located to the right of the person count label.
 * It is used to decrement the number of people the bill is splitted with.
 */
@property XCUIElement *buttonDecrementPersonCount;

/*
 * Static Text that displays choose a tip label which is located below the person count label section
 */
@property XCUIElement *labelChooseTip;

/*
 * An error alert view shown when there are input errors
 */
@property XCUIElement *labelErrorAlert;

/*
 * An error alert view static text that displays the error msg.
 */
@property XCUIElement *labelErrorAlertMsg;

/*
 * OK button on the alert view to dismiss it.
 */
@property XCUIElement *buttonAlertOK;


/*
 * The tip selection view that is located below the choose tip label, contains tip selection option buttons.
 * Refer to SectionTipSelection interface
 */
@property SectionTipSelection *sectionTipSelection;


/*
 * Static Text that shows the label 'Total Per Person', it is located below the choose tip section
 */
@property XCUIElement *labelTotalPerPerson;

/*
 * Static Text that shows the total bill amount per person, it is located below the choose tip section.
 */
@property XCUIElement *labelTotalBillAmountPerPerson;

/*
 * Button that is located below the total bill amount label.
 * It is used to display the view bill history view controller.
 */
@property XCUIElement *buttonViewBillHistory;


/*
 * Button that is located below the total bill amount label.
 * It is used to calculate the bill amount per person.
 */
@property XCUIElement *buttonCalculate;



/*
 * A method to set the people count.
 */
- (bool) setPeopleCount:(int)count;

/*
 * A method to enter the total bill amt.
 */
- (bool) enterTotalBillAmt:(NSString *)billAmt;




@end


@interface SectionTipSelection : Page

/*
 * A button that is located in the tip selection section.
 * Sets the tip percentage amount to 0%
 */
@property XCUIElement *buttonTipZero;

/*
 * A button that is located in the tip selection section.
 * Sets the tip percentage amount to 10%
 */
@property XCUIElement *buttonTipTen;

/*
 * A button that is located in the tip selection section.
 * Sets the tip percentage amount to 15%
 */
@property XCUIElement *buttonTipFifeteen;

/*
 * A button that is located in the tip selection section.
 * Sets the tip percentage amount to 20%
 */
@property XCUIElement *buttonTipTwenty;

/*
 * Init tip section from a view from the bill entry section
 */
- (instancetype)initWithView:(XCUIElement *)view;

/*
 * set tip percentage
 */
- (bool)setTipPercentage:(int)tipPercentage;

@end

