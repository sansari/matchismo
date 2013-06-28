//
//  Card.h
//  Matchismo
//
//  Created by Salman Ansari on 6/21/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isFaceUp) BOOL faceUp;

@property (nonatomic, getter=isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;

@end
