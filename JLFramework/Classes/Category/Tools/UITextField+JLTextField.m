//
//  UITextField+JLTextField.m
//  Pods
//
//  Created by Jason Li on 2017/4/5.
//
//

#import "UITextField+JLTextField.h"
#import <objc/runtime.h>
#import "NSString+JLString.h"
#import "NSObject+JLLayout.h"

static const void *textFieldMenuUnvisible = &textFieldMenuUnvisible;

@implementation UITextField (JLTextField)
- (BOOL)menuUnvisible {
    return [objc_getAssociatedObject(self, textFieldMenuUnvisible) boolValue];
}

- (void)setMenuUnvisible:(BOOL)menuUnvisible {
    objc_setAssociatedObject(self, textFieldMenuUnvisible, @(menuUnvisible), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (void)setPlaceholderColor:(UIColor *)color {
    if (self.placeholder.length > 0) {
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:color}];
    }
    
}

- (NSMutableAttributedString *)attributedString {
    NSMutableAttributedString *string = nil;
    if (self.attributedText) {
        string = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    } else {
        string = [[NSMutableAttributedString alloc] initWithString:self.text];
        [string addAttribute:NSFontAttributeName value:self.font range:[self.text range]];
        [string addAttribute:NSForegroundColorAttributeName value:self.textColor range:[self.text range]];
        [string addAttribute:NSBackgroundColorAttributeName value:self.backgroundColor range:[self.text range]];
        
    }
    
    return string;
}

- (void)addAttributeFont:(id)font ragne:(NSRange)range {
    NSMutableAttributedString *string = [self attributedString];
    [string removeAttribute:NSFontAttributeName range:range];
    [string addAttribute:NSFontAttributeName value:font range:range];
    
    [self setAttributedText:string];
}

- (void)addAttributeColor:(id)color ragne:(NSRange)range {
    NSMutableAttributedString *string = [self attributedString];
    [string removeAttribute:NSForegroundColorAttributeName range:range];
    [string addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    [self setAttributedText:string];
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (self.menuUnvisible) {
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        if (menuController) {
            [UIMenuController sharedMenuController].menuVisible = NO;
        }
        
        return NO;
    }
    
    return [super canPerformAction:action withSender:sender];
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds {
    bounds.size.height = CGRectGetHeight(self.bounds);
    bounds.size.width = CGRectGetHeight(self.bounds);
    return bounds;
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds {
    bounds.size.height = CGRectGetHeight(self.bounds);
    bounds.size.width = CGRectGetHeight(self.bounds);
    bounds.origin.x = CGRectGetWidth(self.bounds) - CGRectGetWidth(bounds);
    
    return bounds;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    if (self.layer.borderWidth > 0.0f && !self.leftView) {
        bounds.origin.x += self.edgeInsets.left;
    } else if (self.leftView && self.textAlignment != NSTextAlignmentRight) {
        bounds.origin.x += CGRectGetMaxX(self.leftView.frame);
    }
    return bounds;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    if (self.layer.borderWidth > 0.0f && !self.leftView) {
        bounds.origin.x += self.edgeInsets.left;
    } else if (self.leftView && self.textAlignment != NSTextAlignmentRight) {
        bounds.origin.x += CGRectGetMaxX(self.leftView.frame);
    }
    return bounds;
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    if (self.layer.borderWidth > 0.0f && !self.leftView) {
        bounds.origin.x += self.edgeInsets.left;
    } else if (self.leftView && self.textAlignment != NSTextAlignmentRight) {
        bounds.origin.x += CGRectGetMaxX(self.leftView.frame);
    }
    return bounds;
}
@end
