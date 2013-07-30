//
//  SetCard.h
//  Matchismo
//
//  Created by Salman Ansari on 7/29/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *contents;
@property (strong, nonatomic) NSNumber *number;
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSString *shading;
@property (strong, nonatomic) UIColor *color;

+ (NSArray *)validSymbols;
+ (NSArray *)validShadings;
+ (NSArray *)validColors;
+ (NSArray *)validNumbers;

@end
