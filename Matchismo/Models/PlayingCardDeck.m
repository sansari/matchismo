//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Salman Ansari on 6/21/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

- (id)init
{
    self = [super init];

    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card atTop:YES];
            }
        }
    }

    return self;
}

@end
