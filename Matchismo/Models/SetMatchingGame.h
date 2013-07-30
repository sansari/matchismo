//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Salman Ansari on 6/24/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface SetMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

@property (nonatomic, readonly) NSString *status;

@property (nonatomic, readonly, getter=isInProgress) BOOL inProgress;

@end
