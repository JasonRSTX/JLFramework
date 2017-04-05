//
//  JLKeyValueVC.m
//  JLFramework
//
//  Created by Jason Li on 2017/3/31.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLKeyValueVC.h"
#import "JLPerson.h"

#import "UIColor+Project.h"

@import JLFramework;
@import Masonry;

@interface JLKeyValueVC ()
@property (nonatomic, strong) JLPerson *person;

@property (nonatomic, strong) UIButton *btnNilValue;
@property (nonatomic, strong) UIButton *btnSetUndefineKey;
@property (nonatomic, strong) UIButton *btnGetUndefineKey;

@end

@implementation JLKeyValueVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.contentInsets = self.edgeInsets;
    
    [self.view addSubview:self.btnNilValue];
    [self.view addSubview:self.btnSetUndefineKey];
    [self.view addSubview:self.btnGetUndefineKey];
    
    self.labExampleDesc.text = @"NSObject+JLKeyValue 主要通过Hook的方式截获了NSUndefinedKeyException异常和NSInvalidArgumentException异常引起的Crash。\n\n特点：\n1、使用方便无需修改代码，工程中加入NSObject+JLKeyValue.h和.m文件即可。\n2、通过NSLog将问题Key异常信息输出到控制台，以便开发时处理解决。";
    
}

- (void)setupLayoutConstraint {
    [super setupLayoutConstraint];
    
    __weak typeof(self) weakSelf = self;
    [self.btnNilValue mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(make.edgeInsets);
        make.bottom.mas_equalTo(weakSelf.view).mas_offset(- make.edgeInsets.bottom);
        make.height.mas_equalTo(make.rowHeight);
    }];
    
    [self.btnSetUndefineKey mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(weakSelf.btnNilValue);
        make.bottom.mas_equalTo(weakSelf.btnNilValue.mas_top).mas_offset(- make.controlHalfInterval);
    }];
    
    [self.btnGetUndefineKey mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(weakSelf.btnNilValue);
        make.bottom.mas_equalTo(weakSelf.btnSetUndefineKey.mas_top).mas_offset(- make.controlHalfInterval);
    }];
}

//MARK: - Action To Oper
- (void)actionToOperNilVauleButton {
    NSLog(@"向Model中一个非指针类property赋值nil.");
    [self.person setValue:nil forKey:@"age"];
    
}

- (void)actionToOperSetValueForUndefinedKey {
    NSLog(@"向Model中一个不存在的property赋值.");
    [self.person setValue:@"address" forKey:@"address"];
    
}

- (void)actionToOperGetValueForUndefinedKey {
    NSLog(@"从Model的一个不存在的property中取值.");
    [self.person valueForKey:@"sex"];
    
}

//MARK: - Getter And Setter
- (JLPerson *)person {
    if (_person) return _person;
    _person = [[JLPerson alloc] init];
    _person.name = @"Jason Li";
    _person.age = 20;
    
    return _person;
}

- (UIButton *)btnNilValue {
    if (_btnNilValue) return _btnNilValue;
    _btnNilValue = [self defaultButton];
    
    [_btnNilValue setTitle:@"-setNilValueForKey:" forState:UIControlStateNormal];
    [_btnNilValue addTarget:self action:@selector(actionToOperNilVauleButton) forControlEvents:UIControlEventTouchUpInside];
    
    return _btnNilValue;
}

- (UIButton *)btnSetUndefineKey {
    if (_btnSetUndefineKey) return _btnSetUndefineKey;
    _btnSetUndefineKey = [self defaultButton];
    
    [_btnSetUndefineKey setTitle:@"-setValue:forUndefinedKey:" forState:UIControlStateNormal];
    [_btnSetUndefineKey addTarget:self action:@selector(actionToOperSetValueForUndefinedKey) forControlEvents:UIControlEventTouchUpInside];
    
    return _btnSetUndefineKey;
}

- (UIButton *)btnGetUndefineKey {
    if (_btnGetUndefineKey) return _btnGetUndefineKey;
    _btnGetUndefineKey = [self defaultButton];
    
    [_btnGetUndefineKey setTitle:@"-valueForUndefinedKey:" forState:UIControlStateNormal];
    [_btnGetUndefineKey addTarget:self action:@selector(actionToOperGetValueForUndefinedKey) forControlEvents:UIControlEventTouchUpInside];
    
    return _btnGetUndefineKey;
}

@end
