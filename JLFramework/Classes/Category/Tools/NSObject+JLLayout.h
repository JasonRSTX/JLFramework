//
//  NSObject+JLLayout.h
//  Pods
//
//  Created by Jason Li on 2017/3/30.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (JLLayout)
- (UIEdgeInsets)edgeInsets;

- (CGFloat)rowHeight;
- (CGFloat)navHeight;
- (CGFloat)statusBarHeight;
- (CGFloat)tabBarHeight;

- (CGFloat)controlInterval;
- (CGFloat)controlHalfInterval;

- (CGFloat)cornerRadius;

@end
