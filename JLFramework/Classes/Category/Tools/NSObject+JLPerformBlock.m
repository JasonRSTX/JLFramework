//
//  NSObject+JLPerformBlock.m
//  Pods
//
//  Created by Jason Li on 2017/3/13.
//
//

#import "NSObject+JLPerformBlock.h"

@implementation NSObject (JLPerformBlock)
- (void)performBlock:(void (^)())block {
    [self performBlock:block afterDelay:0];
}

- (void)performBlock:(void (^)())block afterDelay:(NSTimeInterval)delay {
    [self performSelector:@selector(fireBlockAfterDelay:) withObject:block afterDelay:delay];
}

- (void)fireBlockAfterDelay:(void (^)())block {
    if (block) block();
}


@end
