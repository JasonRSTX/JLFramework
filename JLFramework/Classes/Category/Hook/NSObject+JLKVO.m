//
//  NSObject+JLKVO.m
//  Pods
//
//  Created by Jason Li on 2017/5/15.
//
//

#import "NSObject+JLKVO.h"

@import JRSwizzle;

@implementation NSObject (JLKVO)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSError *error;
        BOOL result = [[self class] jr_swizzleMethod:@selector(removeObserver:forKeyPath:) withMethod:@selector(jl_removeObserver:forKeyPath:) error:&error];
        if (!result || error) {
            NSLog(@"Can't swizzle methods - %@", [error description]);
        }
        
        result = [[self class] jr_swizzleMethod:@selector(addObserver:forKeyPath:options:context:) withMethod:@selector(jl_addObserver:forKeyPath:options:context:) error:&error];
        if (!result || error) {
            NSLog(@"Can't swizzle methods - %@", [error description]);
        }
    });
}

- (void)jl_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context {
    if (![self observerKeyPath:keyPath observer:observer]) {
        [self jl_addObserver:observer forKeyPath:keyPath options:options context:context];
    }
    
}

- (void)jl_removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath {
    if ([self observerKeyPath:keyPath observer:observer]) {
        [self jl_removeObserver:observer forKeyPath:keyPath];
    }
    
}

// 进行检索获取Key
- (BOOL)observerKeyPath:(NSString *)key observer:(id )observer
{
    id info = self.observationInfo;
    NSArray *array = [info valueForKey:@"_observances"];
    for (id objc in array) {
        id Properties = [objc valueForKeyPath:@"_property"];
        id newObserver = [objc valueForKeyPath:@"_observer"];
        
        NSString *keyPath = [Properties valueForKeyPath:@"_keyPath"];
        if ([key isEqualToString:keyPath] && [newObserver isEqual:observer]) {
            return YES;
        }
    }
    return NO;
}

@end
