//
//  NSObject+JLUserDefault.h
//  Pods
//
//  Created by Jason Li on 2017/3/13.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (JLUserDefault)
- (void)setUserDefaultObject:(id)value forKey:(NSString *)key;
- (id)userDefaultObjectForKey:(NSString *)key;

@end
