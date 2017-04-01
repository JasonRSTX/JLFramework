//
//  UIColor+Project.m
//  JLFramework
//
//  Created by Jason Li on 2017/3/30.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "UIColor+Project.h"

@implementation UIColor (Project)

+ (instancetype)sportColor {
    return [UIColor colorWithRed:77.f/255.f green:218.f/255.f blue:172.f/255.f alpha:1];
}

+ (instancetype)dataColor {
    return [UIColor colorWithWhite:0.2 alpha:1];
}

+ (instancetype)grayDataColor {
    return [UIColor lightGrayColor];
}

@end
