//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Salman Ansari on 6/24/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import "SetMatchingGame.h"

@interface SetMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) int score;
@property (nonatomic, readwrite) NSString *status;
@property (nonatomic, readwrite) BOOL inProgress;
@end

@implementation SetMatchingGame

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

#define FLIP_COST 1
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2

- (void)flipCardAtIndex:(NSUInteger)index {
    self.inProgress = YES;

    Card *card = [self cardAtIndex:index];

    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            NSMutableArray *faceUpCards = [[NSMutableArray alloc] init];

            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    [faceUpCards addObject:otherCard];
                }
            }

            if (faceUpCards.count == 2) {
                int matchScore = [card match:faceUpCards];

                if (matchScore) {
                    card.unplayable = YES;
                    for (Card *faceUpCard in faceUpCards) {
                        faceUpCard.unplayable = YES;
                    }

                    self.score += matchScore * MATCH_BONUS;
                    self.status = [NSString stringWithFormat:@"Matched %@ & %@ & %@ for %d points!",
                                   card.contents,
                                   [[faceUpCards objectAtIndex:0] contents],
                                   [[faceUpCards objectAtIndex:1] contents],
                                   matchScore * MATCH_BONUS];
                } else {
                    self.status = [NSString stringWithFormat:@"No match. %d points penalized.", MISMATCH_PENALTY];
                    self.score -= MISMATCH_PENALTY;

                    for (Card *faceUpCard in faceUpCards) {
                        faceUpCard.faceUp = NO;
                    }
                }
            }
            
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.faceUp;
    }
}

@end
