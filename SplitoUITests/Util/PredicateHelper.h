//
//  PredicateHelper.h
//  Splito
//
//  Created by Sajid on 27/7/22.
//


#define LABEL_ENDS(string) [NSPredicate predicateWithFormat:@"label ENDSWITH[c] %@", string]
#define LABEL_EQUALS(string) [NSPredicate predicateWithFormat:@"label ==[c] %@", string]
#define LABEL_BEGINS(string) [NSPredicate predicateWithFormat:@"label BEGINSWITH[c] %@", string]

#define VALUE_ENDS(string) [NSPredicate predicateWithFormat:@"value ENDSWITH[c] %@", string]
#define VALUE_EQUALS(string) [NSPredicate predicateWithFormat:@"value ==[c] %@", string]
#define VALUE_BEGINS(string) [NSPredicate predicateWithFormat:@"value BEGINSWITH[c] %@", string]

#define IDENTIFIER_ENDS(string) [NSPredicate predicateWithFormat:@"identifier ENDSWITH[c] %@", string]
#define IDENTIFIER_EQUALS(string) [NSPredicate predicateWithFormat:@"identifier ==[c] %@", string]
#define IDENTIFIER_BEGINS(string) [NSPredicate predicateWithFormat:@"identifier BEGINSWITH[c] %@", string]

#define PLACEHOLDER_ENDS(string) [NSPredicate predicateWithFormat:@"placeholderValue ENDSWITH[c] %@", string]
#define PLACEHOLDER_EQUALS(string) [NSPredicate predicateWithFormat:@"placeholderValue ==[c] %@", string]
#define PLACEHOLDER_BEGINS(string) [NSPredicate predicateWithFormat:@"placeholderValue BEGINSWITH[c] %@", string]

#define EXISTS [NSPredicate predicateWithFormat:@"exists == 1"]
#define NOT_EXISTS [NSPredicate predicateWithFormat:@"exists == 0"]
