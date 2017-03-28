//
//  NSObject+JLKeyboard.h
//  Pods
//
//  Created by Jason Li on 2017/3/13.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (JLKeyboard)
/**
 *  添加键盘通知 配合 addNotificationCenter 使用
 **/
- (void)addKeyboardNotification;
/**
 *  删除键盘通知 配合 removeNotificationCenter 使用
 **/
- (void)removeKeyboardNotification;

/**
 *  获取键盘的Size
 *
 *  @param notification UIKeyboardWillShowNotification/UIKeyboardWillHideNotification
 *  @return 键盘 CGSize
 *
 **/
- (CGSize)sizeKeyboard:(NSNotification *)notification;
/**
 *  获取键盘的高度
 *
 *  @param notification UIKeyboardWillShowNotification/UIKeyboardWillHideNotification
 *  @return CGFloat
 *
 **/
- (CGFloat)heightKeyboard:(NSNotification *)notification;
/**
 *  获取键盘响应动画时长
 *
 *  @param notification UIKeyboardWillShowNotification/UIKeyboardWillHideNotification
 *  @return NSTimeInterval
 *
 **/
- (NSTimeInterval)durationKeyboardAnimation:(NSNotification *)notification;

/**
 * 键盘打开前通知响应方法 处理键盘打开前需要处理的逻辑
 **/
- (void)keyboardWillShow:(NSNotification *)notification;
/**
 * 键盘隐藏前通知响应方法 处理键盘隐藏前需要处理的逻辑
 **/
- (void)keyboardWillHide:(NSNotification *)notification;
@end
