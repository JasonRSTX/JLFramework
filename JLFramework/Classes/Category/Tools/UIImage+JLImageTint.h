//
//  UIImage+JLImageTint.h
//  Pods
//
//  Created by Jason Li on 2017/3/27.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (JLImageTint)
NS_ASSUME_NONNULL_BEGIN
+ (instancetype)imageNamed:(NSString *)name tintColor:(nullable UIColor *)tintColor;

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithTintColor:(UIColor *)tintColor alpha:(CGFloat)alpha;

- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendModel:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
NS_ASSUME_NONNULL_END

@end
