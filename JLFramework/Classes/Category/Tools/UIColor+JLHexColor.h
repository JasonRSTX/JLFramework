//
//  UIColor+JLHexColor.h
//  Pods
//
//  Created by Jason Li on 2017/4/6.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (JLHexColor)
+ (instancetype)colorWithHex:(NSString *)hex;
+ (instancetype)colorWithHex:(NSString *)hex alpha:(CGFloat)alpha;

+ (NSString *)hexFromColor:(UIColor *)color;

@end
