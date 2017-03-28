//
//  UITextField+JLTextFieldAttribute.m
//  Pods
//
//  Created by Jason Li on 2017/3/27.
//
//

#import "UITextField+JLTextFieldAttribute.h"
#import "NSString+JLString.h"

@implementation UITextField (JLTextFieldAttribute)
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

@end
