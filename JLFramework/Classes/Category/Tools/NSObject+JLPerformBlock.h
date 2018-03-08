//
//  NSObject+JLPerformBlock.h
//  Pods
//
//  Created by Jason Li on 2017/3/13.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (JLPerformBlock)
- (void)performBlock:(void (^)(void))block;
- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end
