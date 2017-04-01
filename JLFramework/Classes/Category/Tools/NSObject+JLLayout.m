//
//  NSObject+JLLayout.m
//  Pods
//
//  Created by Jason Li on 2017/3/30.
//
//

#import "NSObject+JLLayout.h"

@implementation NSObject (JLLayout)
- (UIEdgeInsets)edgeInsets {
    return UIEdgeInsetsMake(8.0f, 15.0f, 8.0f, 15.0f);
}

- (CGFloat)rowHeight {
    return 44.f;
}

- (CGFloat)navHeight {
    return 64.f;
}

- (CGFloat)statusBarHeight {
    return 20.f;
}

- (CGFloat)tabBarHeight {
    return 48.f;
}

- (CGFloat)controlInterval {
    return 10.f;
}

- (CGFloat)controlHalfInterval {
    return self.controlInterval/2.0f;
}

- (CGFloat)cornerRadius {
    return 4.f;
}

@end
