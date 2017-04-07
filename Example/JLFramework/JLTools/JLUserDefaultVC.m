//
//  JLUserDefaultVC.m
//  JLFramework
//
//  Created by Jason Li on 2017/4/7.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLUserDefaultVC.h"
#import "UIColor+Project.h"
#import "UIFont+Project.h"

@import JLFramework;
@import Masonry;

@interface JLUserDefaultVC ()
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) NSString *userDefalutKey;
@property (nonatomic, strong) UIButton *btnSave;
@property (nonatomic, strong) UIButton *btnRead;

@end

@implementation JLUserDefaultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.textField];
    [self.view addSubview:self.btnRead];
    [self.view addSubview:self.btnSave];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionToOperEndEditing)]];
    self.labExampleDesc.text = self.desc;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self addKeyboardNotification];
    [self setKeyboardResponseView:self.view];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self removeKeyboardNotification];
}

- (void)setupLayoutConstraint {
    [super setupLayoutConstraint];
    
    __weak typeof(self) weakSelf = self;
    [self.btnRead mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(make.edgeInsets);
        make.right.mas_equalTo(weakSelf.btnSave.mas_left).mas_offset(- make.controlInterval);
        make.height.mas_offset(make.rowHeight);
        make.width.mas_equalTo(weakSelf.view.mas_width).mas_offset(- (make.edgeInsets.left + make.controlHalfInterval)).multipliedBy(0.5);
        
    }];
    
    [self.btnSave mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(make.edgeInsets);
        make.left.mas_equalTo(weakSelf.btnRead.mas_right).mas_equalTo(make.controlInterval);
        make.height.mas_equalTo(make.rowHeight);
        
    }];
    
    [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(make.edgeInsets);
        make.bottom.mas_equalTo(weakSelf.btnRead.mas_top).mas_offset(- make.controlHalfInterval);
        make.height.mas_equalTo(make.rowHeight);
        
    }];
}

//MARK: - Action To Oper
- (void)actionToOperEndEditing {
    [self.view endEditing:YES];
}

- (void)actionToOperReadUserDefaultData {
    self.labExampleDesc.text = [NSString stringWithFormat:@"%@\n\n%@",self.desc,[self userDefaultObjectForKey:self.userDefalutKey]];
}

- (void)actionToOperSaveUserDefalutData {
    if (self.textField.text.length == 0) {
        [self showAlertNote:@"写点什么再存吧！"];
        return;
    }
    [self actionToOperEndEditing];
    [self setUserDefaultObject:self.textField.text forKey:self.userDefalutKey];
}

//MARK: - Getter And Setter
- (NSString *)desc {
    if (_desc) return _desc;
    _desc = @"提供了向standardUserDefaults中存储和读取数据的简便方法。使用self直接调用即可。\n\n- (void)setUserDefaultObject:forKey:\n-userDefaultObjectForKey:";
    
    return _desc;
}

- (NSString *)userDefalutKey {
    if (_userDefalutKey) return _userDefalutKey;
    _userDefalutKey = @"userDefaultKey";
    
    return _userDefalutKey;
}

- (UITextField *)textField {
    if (_textField) return _textField;
    _textField = [[UITextField alloc] init];
    
    _textField.layer.borderColor = [UIColor sportColor].CGColor;
    _textField.layer.borderWidth = 0.5f;
    _textField.layer.cornerRadius = self.cornerRadius;
    
    _textField.placeholder = @"输入内容保存至UserDefault。";
    
    return _textField;
}

- (UIButton *)btnRead {
    if (_btnRead) return _btnRead;
    _btnRead = [self defaultButton];
    
    [_btnRead setTitle:@"Read" forState:UIControlStateNormal];
    [_btnRead addTarget:self action:@selector(actionToOperReadUserDefaultData) forControlEvents:UIControlEventTouchUpInside];
    
    return _btnRead;
}

- (UIButton *)btnSave {
    if (_btnSave) return _btnSave;
    _btnSave = [self defaultButton];
    
    [_btnSave setTitle:@"Save" forState:UIControlStateNormal];
    [_btnSave addTarget:self action:@selector(actionToOperSaveUserDefalutData) forControlEvents:UIControlEventTouchUpInside];
    
    return _btnSave;
}

@end
