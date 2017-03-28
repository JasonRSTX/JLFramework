//
//  NSObject+JLUserDefault.m
//  Pods
//
//  Created by Jason Li on 2017/3/13.
//
//

#import "NSObject+JLUserDefault.h"

@implementation NSObject (JLUserDefault)
- (void)setUserDefaultObject:(id)value forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id)userDefaultObjectForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

@end
