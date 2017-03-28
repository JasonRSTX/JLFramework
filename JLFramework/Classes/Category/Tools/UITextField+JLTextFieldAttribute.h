//
//  UITextField+JLTextFieldAttribute.h
//  Pods
//
//  Created by Jason Li on 2017/3/27.
//
//

#import <UIKit/UIKit.h>

@interface UITextField (JLTextFieldAttribute)
- (void)addAttributeColor:(id)color ragne:(NSRange)range;
- (void)addAttributeFont:(id)font ragne:(NSRange)range;

@end
