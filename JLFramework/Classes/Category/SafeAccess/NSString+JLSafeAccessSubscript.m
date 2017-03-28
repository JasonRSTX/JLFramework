//
//  NSString+JLSafeAccessSubscript.m
//  Pods
//
//  Created by Jason Li on 2017/3/13.
//
//

#import "NSString+JLSafeAccessSubscript.h"

@implementation NSString (JLSafeAccessSubscript)
- (id)objectForKeyedSubscript:(id)key {
    return nil;
}

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return nil;
}

@end
