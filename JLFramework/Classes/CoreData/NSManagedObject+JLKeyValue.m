//
//  NSManagedObject+JLKeyValue.m
//  Pods
//
//  Created by Jason Li on 2017/3/29.
//
//

#import "NSManagedObject+JLKeyValue.h"
@import JRSwizzle;

@implementation NSManagedObject (JLKeyValue)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSError *error;
        BOOL result = [[self class] jr_swizzleMethod:@selector(setNilValueForKey:) withMethod:@selector(jl_setNilValueForKey:) error:&error];
        if (!result || error) {
            NSLog(@"Can't swizzle methods - %@", [error description]);
        }
        
        result = [[self class] jr_swizzleMethod:@selector(setValue:forUndefinedKey:) withMethod:@selector(jl_setValue:forUndefinedKey:) error:&error];
        if (!result || error) {
            NSLog(@"Can't swizzle methods - %@", [error description]);
        }
        
        result = [[self class] jr_swizzleMethod:@selector(valueForUndefinedKey:) withMethod:@selector(jl_valueForUndefinedKey:) error:&error];
        if (!result || error) {
            NSLog(@"Can't swizzle methods - %@", [error description]);
        }
    });
}

- (void)jl_setNilValueForKey:(NSString *)key {
#ifdef DEBUG
    NSLog(@"*** %s, The key is %@",__func__,key);
#endif
}

- (void)jl_setValue:(id)value forUndefinedKey:(NSString *)key {
#ifdef DEBUG
    NSLog(@"*** %s, The key is %@",__func__,key);
#endif
}

- (id)jl_valueForUndefinedKey:(NSString *)key {
#ifdef DEBUG
    NSLog(@"*** %s, The key is %@",__func__,key);
#endif
    return nil;
}
@end
