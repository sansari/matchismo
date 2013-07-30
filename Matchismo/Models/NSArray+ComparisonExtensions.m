//
//  NSArray+ComparisonExtensions.m
//  Matchismo
//
//  Created by Salman Ansari on 7/30/13.
//  Copyright (c) 2013 Dare To Build. All rights reserved.
//

#import "NSArray+ComparisonExtensions.h"

@implementation NSArray (ComparisonExtensions)

- (BOOL) allValuesEqual {
    NSObject* previousValue = nil;
    for (NSObject* value in self) {
        if (previousValue && ![previousValue isEqual:value])
            return NO;
        previousValue = value;
    }
    return YES;
}

- (BOOL) allValuesDifferent {
    if ([self count] != 3) {
        [NSException raise:@"Unsupported array size for function allValuesDifferent" format:@"size (%d) of array is invalid", [self count]];
    }
    
    return (![[self objectAtIndex:0] isEqual:[self objectAtIndex:1]] &&
            ![[self objectAtIndex:1] isEqual:[self objectAtIndex:2]] &&
            ![[self objectAtIndex:0] isEqual:[self objectAtIndex:2]]);
}

@end
