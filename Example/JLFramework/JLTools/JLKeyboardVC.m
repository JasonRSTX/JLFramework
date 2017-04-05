//
//  JLKeyboardVC.m
//  JLFramework
//
//  Created by Jason Li on 2017/4/5.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLKeyboardVC.h"
#import "UIColor+Project.h"
#import "UIFont+Project.h"

@import JLFramework;
@import Masonry;

@interface JLKeyboardVC ()
@property (nonatomic, strong) UITextField *field;
@property (nonatomic, strong) NSNotification *keyboardNotification;

@end

@implementation JLKeyboardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.field];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionToOperTapView)]];
    
    self.labExampleDesc.text = @"键盘交互示例：移动被键盘遮挡视图。\n\n1、导入NSObject+JLKeyboard.h；\n2、调用-addKeyboardNotification添加键盘通知；\n3、设置响应键盘的视图keyboardResponseView；\n\n另外：\n可以通过实现协议JLKeyboardOperProtocol中的方法实现在键盘出现前后、隐藏前后的业务逻辑\n-keyboardWillShow\n-keyboardDidShow\n-keyboardWillHide\n-keyboardDidHide";
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // 添加键盘监听
    [self addKeyboardNotification];
    // 设置键盘响应视图
    self.keyboardResponseView = self.view;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 移除键盘监听事件
    [self removeKeyboardNotification];
}

- (void)setupLayoutConstraint {
    [super setupLayoutConstraint];
    
    if (![self isShowedKeyboard]) {
        [self.field mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(make.edgeInsets);
            make.height.mas_equalTo(make.rowHeight);
        }];
    }
    
}

- (void)keyboardDidShow {
    self.field.placeholder = @"点击视图其他位置，回收键盘。";
}

- (void)keyboardDidHide {
    self.field.placeholder = @"点击此处，视图随键盘上移。";
}

//MARK: - Action To Oper
- (void)actionToOperTapView {
    [self.view endEditing:YES];
}

//MARK: - Getter And Setter
- (UITextField *)field {
    if (_field) return _field;
    _field = [[UITextField alloc] init];
    _field.layer.borderColor = [UIColor sportColor].CGColor;
    _field.layer.borderWidth = 0.5f;
    _field.layer.cornerRadius = _field.cornerRadius;
    
    _field.placeholder = @"点击此处，视图随键盘上移。";
    
    return _field;
}

@end
