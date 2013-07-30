//
//  SetCard.m
//  Matchismo
//
//  Created by Salman Ansari on 7/29/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import "SetCard.h"
#import "NSArray+ComparisonExtensions.h"

@implementation SetCard

@synthesize symbol = _symbol;

+ (NSArray *)validSymbols {
    static NSArray *validSymbols = nil;
    if (!validSymbols) validSymbols = @[@"▲",@"●",@"■"];
    return validSymbols;
}

- (void)setSymbol:(NSString *)symbol {
    if ([[SetCard validSymbols] containsObject:symbol]) {
        _symbol = symbol;
    }
}

- (NSString *)symbol {
    return _symbol ? _symbol : @"?";
}

+ (NSArray *)validColors {
    static NSArray *validColors = nil;
    if (!validColors) validColors = @[[UIColor redColor],
                                      [UIColor greenColor],
                                      [UIColor purpleColor]];
    return validColors;
}

+ (NSArray *)validShadings {
    static NSArray *validShadings = nil;
    if (!validShadings) validShadings = @[@"solid",@"striped",@"open"];
    return validShadings;
}

+ (NSArray *)validNumbers {
    static NSArray *validNumbers = nil;
    if (!validNumbers) validNumbers = @[[NSNumber numberWithInt:1],
                                        [NSNumber numberWithInt:2],
                                        [NSNumber numberWithInt:3]];
    return validNumbers;
}

- (NSString *)contents
{
    return self.symbol;
}

- (int)match:(NSArray *)otherCards {
    int score = 0;

    SetCard *secondCard = [otherCards objectAtIndex:0];
    SetCard *thirdCard = [otherCards objectAtIndex:1];

    NSArray *numbers = @[self.number, secondCard.number, thirdCard.number];
    NSArray *symbols = @[self.symbol, secondCard.symbol, thirdCard.symbol];
    NSArray *colors = @[self.color, secondCard.color, thirdCard.color];
    NSArray *shadings = @[self.shading, secondCard.shading, thirdCard.shading];

    if (([numbers allValuesEqual] || [numbers allValuesDifferent]) &&
        ([symbols allValuesEqual] || [symbols allValuesDifferent]) &&
        ([colors allValuesEqual] || [colors allValuesDifferent]) &&
        ([shadings allValuesEqual] || [shadings allValuesDifferent])) {
        score = 10;
    }

    return score;
}

@end
