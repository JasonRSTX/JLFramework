//
//  UIDevice+JLDevice.h
//  Pods
//
//  Created by Jason Li on 2017/3/27.
//
//

#import <UIKit/UIKit.h>

@interface UIDevice (JLDevice)
+ (BOOL)currentSystemVersionLessThan:(CGFloat)targetVersion;

@end
