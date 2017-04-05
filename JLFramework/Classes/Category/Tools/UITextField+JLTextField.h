//
//  UITextField+JLTextField.h
//  Pods
//
//  Created by Jason Li on 2017/4/5.
//
//

#import <UIKit/UIKit.h>

@interface UITextField (JLTextField)
@property (nonatomic, assign) BOOL menuUnvisible;//default NO;

- (void)setPlaceholderColor:(UIColor *)color;

- (void)addAttributeColor:(id)color ragne:(NSRange)range;
- (void)addAttributeFont:(id)font ragne:(NSRange)range;

@end
