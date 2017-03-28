//
//  JLSafeAccessSubscriptProtocol.h
//  Pods
//
//  Created by Jason Li on 2017/3/13.
//
//

#import <Foundation/Foundation.h>

@protocol JLSafeAccessSubscriptProtocol <NSObject>
@required
- (id)objectForKeyedSubscript:(id)key;
- (id)objectAtIndexedSubscript:(NSUInteger)idx;

@optional
- (void)setObject:(id)object forKeyedSubscript:(id < NSCopying >)aKey;
- (void)setObject:(id)anObject atIndexedSubscript:(NSUInteger)index;

@end

#import "NSNull+JLSafeAccessSubscript.h"
#import "NSString+JLSafeAccessSubscript.h"
