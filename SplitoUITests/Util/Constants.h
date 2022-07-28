//
//  Header.h
//  Splito
//
//  Created by Sajid on 27/7/22.
//

#define BILL_INPUT_LIMIT 10000
#define DEFAULT_WAIT_TIME 10
#define MEDIUM_WAIT_TIME 30


/*
 * Since the app doesnt support localisation this is a very implementation to extend supporting multiple languages
 * by passing a lang user defined settings and preprocessor macros in target build settings.
 * EN = 1
 * AR = 2
 */

#if LANG == 1

#define LABEL_EMPTY_LIST @"Empty list"
#define TOTAL_PEOPLE_PREFIX @"Total People: "
#define TOTAL_BILL_PREFIX @"Total Bill: "
#define LABEL_NO_DATA @"No Data"
#define LABEL_ZERO_PERCENT @"0 %"
#define LABEL_TEN_PERCENT @"10 %"
#define LABEL_FIFETEEN_PERCENT @"15 %"
#define LABEL_TWENTY_PERCENT @"20 %"
#define LABEL_ERROR @"Error"
#define LABEL_OK @"OK"
#define LABEL_CALCULATE @"Calculate"
#define LABEL_VIEW_BILL_HISTORY @"View Bill History"
#define LABEL_TOTAL_PER_PERSON @"Total Per Person"
#define LABEL_CHOOSE_TIP @"Choose a tip"
#define LABEL_BILL_EXCEED_MSG @"Maximum bill cannot exceed 10000"


#endif

