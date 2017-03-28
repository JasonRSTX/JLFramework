//
//  NSObject+JLKeyboard.m
//  Pods
//
//  Created by Jason Li on 2017/3/13.
//
//

#import "NSObject+JLKeyboard.h"

@implementation NSObject (JLKeyboard)
- (void)addKeyboardNotification {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center  addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification  object:nil];
    [center addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)removeKeyboardNotification {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [center removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (CGSize)sizeKeyboard:(NSNotification *)notification {
    //获取键盘的size
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    return keyboardRect.size;
}

- (CGFloat)heightKeyboard:(NSNotification *)notification {
    //获取键盘的高度
    return [self sizeKeyboard:notification].height;
}

- (NSTimeInterval)durationKeyboardAnimation:(NSNotification *)notification {
    //获取键盘动画时间
    NSDictionary *userInfo = [notification userInfo];
    NSNumber *aValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval duration = [aValue doubleValue];
    return duration;
}

- (void)keyboardWillShow:(NSNotification *)notification{
    
}

- (void)keyboardWillHide:(NSNotification *)notification{
    
}
@end
