//
//  JLJSONKit.m
//  HeartOfOcean
//
//  Created by Jason Li on 15/9/29.
//  Copyright © 2015年 Company. All rights reserved.
//

#import "JLJSONKit.h"

#pragma mark Deserializing methods
@implementation NSString (JLJSONKitDeserializing)
- (NSData *)dataUsingUTF8 {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (id)fromJsonStringWithOptions:(NSJSONReadingOptions)options {
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:[self dataUsingUTF8]
                                              options:options
                                                error:&error];
    if (error) {
        NSAssert(error, [error localizedFailureReason]);
        return nil;
    }
    return json;
}

- (id)objectFromJSONString {
    return [self fromJsonStringWithOptions:0];
}

- (id)mutableObjectFromJSONString {
    return [self fromJsonStringWithOptions:NSJSONReadingMutableContainers];
}

- (id)fragmentObjectFromJSONString {
    return [self fromJsonStringWithOptions:NSJSONReadingAllowFragments];
}

@end

@implementation NSData (JLJSONKitDeserializing)
- (id)fromJsonDataWithOptions:(NSJSONReadingOptions)options {
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:self
                                              options:options
                                                error:&error];
    if (error) {
        NSAssert(error, [error localizedFailureReason]);
        return nil;
    }
    return json;
}

- (id)objectFromJSONData {
    return [self fromJsonDataWithOptions:0];
}

- (id)mutableObjectFromJSONData {
    return [self fromJsonDataWithOptions:NSJSONReadingMutableContainers];
}

- (id)fragmentObjectFromJSONData {
    return [self fromJsonDataWithOptions:NSJSONReadingAllowFragments];
}

- (id)mutableLeavesFromJSONData {
    return [self fromJsonDataWithOptions:NSJSONReadingMutableLeaves];
}

@end

#pragma mark Serializing methods

@implementation NSString (JLJSONKitSerializing)
- (NSData *)JSONData {
    if (![NSJSONSerialization isValidJSONObject:self]) {
        NSAssert(self, @"The object can't be converted to JSON data.");
        return nil;
    }
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
    if (error) {
        NSAssert(error, [error localizedFailureReason]);
        return nil;
    }
    return data;
}

@end

@implementation NSArray (JLJSONKitSerializing)
- (NSData *)JSONData {
    if (![NSJSONSerialization isValidJSONObject:self]) {
        NSAssert(self, @"The object can't be converted to JSON data.");
        return nil;
    }
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
    if (error) {
        NSAssert(error, [error localizedFailureReason]);
        return nil;
    }
    return data;
}

- (NSString *)JSONString {
    return [[NSString alloc] initWithData:[self JSONData] encoding:NSUTF8StringEncoding];
    
}

@end


@implementation NSDictionary (JLJSONKitSerializing)
- (NSData *)JSONData {
    if (![NSJSONSerialization isValidJSONObject:self]) {
        NSAssert(self, @"The object can't be converted to JSON data.");
        return nil;
    }
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&error];
    if (error) {
        NSAssert(error, [error localizedFailureReason]);
        return nil;
    }
    return data;
}

- (NSString *)JSONString {
    return [[NSString alloc] initWithData:[self JSONData] encoding:NSUTF8StringEncoding];
    
}

@end
