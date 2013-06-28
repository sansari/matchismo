//
//  Deck.h
//  Matchismo
//
//  Created by Salman Ansari on 6/21/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
