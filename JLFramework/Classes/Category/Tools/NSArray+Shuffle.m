//
//  NSArray+Shuffle.m
//  Pods
//
//  Created by Jason Li on 2017/3/13.
//
//

#import "NSArray+Shuffle.h"

@implementation NSArray (Shuffle)
- (NSArray *)shuffle {
    return [self sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return (arc4random() % 3) - 1;
    }];
}

@end
