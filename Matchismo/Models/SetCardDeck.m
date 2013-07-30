//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Salman Ansari on 7/29/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import "SetCard.h"
#import "SetCardDeck.h"

@implementation SetCardDeck

- (id)init
{
    self = [super init];

    if (self) {
        for (NSNumber *number in [SetCard validNumbers]) {
            for (NSString *symbol in [SetCard validSymbols]) {
                for (UIColor *color in [SetCard validColors]) {
                    for (NSString *shading in [SetCard validShadings]) {
                        SetCard *card = [[SetCard alloc] init];
                        card.number = number;
                        card.symbol = symbol;
                        card.color = color;
                        card.shading = shading;
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }

    return self;
}

@end
