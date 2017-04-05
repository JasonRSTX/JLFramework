//
//  JLSubscriptVC.m
//  JLFramework
//
//  Created by Jason Li on 2017/4/1.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLSubscriptVC.h"

@import JLFramework;
@import Masonry;

@interface JLSubscriptVC ()
@property (nonatomic, strong) NSMutableDictionary *dataSource;

@property (nonatomic, strong) UIButton *btnNilSubscript;
@property (nonatomic, strong) UIButton *btnStringSubscript;

@end

@implementation JLSubscriptVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.btnNilSubscript];
    [self.view addSubview:self.btnStringSubscript];
    
    self.labExampleDesc.text = @"角标安全访问 目前包含一个Protocol两个Category.实现了针对数组或字典连续角标取值时中间Value为nil或NSString时No Crash。\n\nProtocol:\nJLSafeAccessSubscriptProtocol\nCategory:\nNSNull+JLSafeAccessSubscript\nNSString+JLSafeAccessSubscript";
    
}

- (void)setupLayoutConstraint {
    [super setupLayoutConstraint];
    
    __weak typeof(self) weakSelf = self;
    [self.btnStringSubscript mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(make.edgeInsets);
        make.bottom.mas_equalTo(weakSelf.view).mas_offset(- make.edgeInsets.bottom);
        make.height.mas_equalTo(make.rowHeight);
    }];
    
    [self.btnNilSubscript mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(weakSelf.btnStringSubscript);
        make.bottom.mas_equalTo(weakSelf.btnStringSubscript.mas_top).mas_offset(- make.controlHalfInterval);
    }];
}

//MARK: - Action To Oper
- (void)actionToOperNilSubscriptButton {
    NSLog(@"连续角标方式获取多级字典数据:");
    NSLog(@"中间数据为字典或数组时正常");
    NSLog(@"%s,self.dataSource[@\"DictKey\"][@\"Key\"] Value is %@",__func__,self.dataSource[@"DictKey"][@"Key"]);
    NSLog(@"中间数据为nil的情况。");
    NSLog(@"%s,self.dataSource[@\"NilKey\"][@\"Key\"] Value is %@",__func__,self.dataSource[@"NilKey"][@"Key"]);
}

- (void)actionToOperStringSubscriptButton {
    NSLog(@"连续角标方式获取多级字典数据:");
    NSLog(@"中间数据为字典或数组时正常");
    NSLog(@"%s,self.dataSource[@\"DictKey\"][@\"Key\"] Value is %@",__func__,self.dataSource[@"DictKey"][@"Key"]);
    NSLog(@"中间数据为NSString的情况。");
    NSLog(@"%s,self.dataSource[@\"StringKey\"][@\"Key\"] Value is %@",__func__,self.dataSource[@"StringKey"][@"Key"]);
}

//MARK: - Getter And Setter
- (UIButton *)btnNilSubscript {
    if (_btnNilSubscript) return _btnNilSubscript;
    _btnNilSubscript = [self defaultButton];
    
    [_btnNilSubscript setTitle:@"Value is Nil." forState:UIControlStateNormal];
    [_btnNilSubscript addTarget:self action:@selector(actionToOperNilSubscriptButton) forControlEvents:UIControlEventTouchUpInside];
    
    return _btnNilSubscript;
}

- (UIButton *)btnStringSubscript {
    if (_btnStringSubscript) return _btnStringSubscript;
    _btnStringSubscript = [self defaultButton];
    
    [_btnStringSubscript setTitle:@"Value's type is NSString." forState:UIControlStateNormal];
    [_btnStringSubscript addTarget:self action:@selector(actionToOperStringSubscriptButton) forControlEvents:UIControlEventTouchUpInside];
    
    return _btnStringSubscript;
}

- (NSMutableDictionary *)dataSource {
    if (_dataSource) return _dataSource;
    _dataSource = [NSMutableDictionary dictionaryWithCapacity:0];
    
    NSObject *nilObj = nil;
    [_dataSource setObject:@{@"Key":@"Value."} forKey:@"DictKey"];
    [_dataSource setValue:nilObj forKey:@"NilKey"];
    [_dataSource setValue:@"String Value." forKey:@"StringKey"];

    return _dataSource;
}

@end
