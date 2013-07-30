//
//  MatchingGame.m
//  Matchismo
//
//  Created by Salman Ansari on 7/30/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import "MatchingGame.h"

@interface MatchingGame()
@property (strong, nonatomic, readwrite) NSMutableArray *cards;
@property (nonatomic, readwrite) int score;
@property (nonatomic, readwrite) NSString *status;
@property (nonatomic, readwrite) BOOL inProgress;
@end

@implementation MatchingGame

- (void)flipCardAtIndex:(NSUInteger)index {
    self.inProgress = YES;

    Card *card = [self cardAtIndex:index];
    card.faceUp = !card.faceUp;
}

- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck {
    self = [super init];

    if (self) {
        self.inProgress = NO;
        for (int i=0; i < count; i++) {
            Card *card = [deck drawRandomCard];

            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }

    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < self.cards.count) ? self.cards[index] : nil;
}
@end
