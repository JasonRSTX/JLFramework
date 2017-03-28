//
//  JLJSONKit.h
//  HeartOfOcean
//
//  Created by Jason Li on 15/9/29.
//  Copyright © 2015年 Company. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark Deserializing methods
@interface NSString (JLJSONKitDeserializing)
- (id)objectFromJSONString;
- (id)mutableObjectFromJSONString;
- (id)fragmentObjectFromJSONString;

@end

@interface NSData (JLJSONKitDeserializing)
// The NSData MUST be UTF8 encoded JSON.
- (id)objectFromJSONData;
- (id)mutableObjectFromJSONData;
- (id)fragmentObjectFromJSONData;
- (id)mutableLeavesFromJSONData;

@end

#pragma mark Serializing methods
@interface NSString (JLJSONKitSerializing)
- (NSData *)JSONData;

@end

@interface NSArray (JLJSONKitSerializing)
- (NSData *)JSONData;
- (NSString *)JSONString;

@end

@interface NSDictionary (JLJSONKitSerializing)
- (NSData *)JSONData;
- (NSString *)JSONString;

@end


