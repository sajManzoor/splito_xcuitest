//
//  BillHistoryScreen.h
//  SplitoUITests
//
//  Created by Sajid on 27/7/22.
//

#import "Page.h"

@interface BillHistoryPage : Page

/*
 * Activity Indicator - progress bar on loading the Bill history screen.
 */
@property XCUIElement *progressBar;

/*
 * A label at the top of the BillHistoryScreen that shows the total number of people.
 */
@property XCUIElement *labelNumPeople;

/*
 * A label at the top of the BillHistoryScreen that shows the total bill amount for the entire list.
 */
@property XCUIElement *labelTotalBill;

/*
 * An image in the middle of the BillHistoryScreen when there is no billing history.
 */
@property XCUIElement *imageNoData;

/*
 * An label in the middle of the BillHistoryScreen when there is no billing history.
 */
@property XCUIElement *labelNoData;

/*
 * An table view which shows the billing record list.
 */
@property XCUIElement *tableViewBillingRecordList;

/*
 * An query which contains the table cells for the billing record list.
 */
@property XCUIElementQuery *cellsBillingHistory;




@end
