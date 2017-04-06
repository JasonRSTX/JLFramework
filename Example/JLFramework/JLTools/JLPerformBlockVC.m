//
//  JLPerformBlockVC.m
//  JLFramework
//
//  Created by Jason Li on 2017/4/6.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLPerformBlockVC.h"

@import JLFramework;
@import Masonry;

@interface JLPerformBlockVC ()
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) UIButton *btnPerformBlock;
@property (nonatomic, strong) UIButton *btnDelayPerformBlock;

@end

@implementation JLPerformBlockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.labExampleDesc.text = self.desc;
    
    [self.view addSubview:self.btnPerformBlock];
    [self.view addSubview:self.btnDelayPerformBlock];
    
}

- (void)setupLayoutConstraint {
    [super setupLayoutConstraint];
    
    __weak typeof(self) weakSelf = self;
    [self.btnDelayPerformBlock mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(make.edgeInsets);
        make.height.mas_equalTo(make.rowHeight);
        
    }];
    
    [self.btnPerformBlock mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(weakSelf.btnDelayPerformBlock);
        make.bottom.mas_equalTo(weakSelf.btnDelayPerformBlock.mas_top).mas_offset(- make.controlHalfInterval);
        
    }];
}

//MARK: - Action To Oper
- (void)actionToOperPerformBlockButton {
    __weak typeof(self) weakSelf = self;
    [self performBlock:^{
        weakSelf.labExampleDesc.text = [NSString stringWithFormat:@"%@\n\nThis is -performBlock:",weakSelf.desc];
    }];
}

- (void)actionToOperDelayPerformBlockButton {
    __weak typeof(self) weakSelf = self;
    [self performBlock:^{
        weakSelf.labExampleDesc.text = [NSString stringWithFormat:@"%@\n\nThis is -performBlock:afterDelay:",weakSelf.desc];
    } afterDelay:10];
}

//MARK: - Getter And Setter
- (NSString *)desc {
    if (_desc) return _desc;
    _desc = @"延期执行Block\n通过NSRunLoop中的\n-performSelector:withObject:afterDelay:\n实现延期执行。\n\n关于执行Block在iOS10中原生方法已经提供\n- (void)performBlock:(void (^)(void))block;";
    
    return _desc;
}

- (UIButton *)btnPerformBlock {
    if (_btnPerformBlock) return _btnPerformBlock;
    _btnPerformBlock = [self defaultButton];
    
    [_btnPerformBlock setTitle:@"PerformBlock" forState:UIControlStateNormal];
    [_btnPerformBlock addTarget:self action:@selector(actionToOperPerformBlockButton) forControlEvents:UIControlEventTouchUpInside];
    
    return _btnPerformBlock;
}

- (UIButton *)btnDelayPerformBlock {
    if (_btnDelayPerformBlock) return _btnDelayPerformBlock;
    _btnDelayPerformBlock = [self defaultButton];
    
    [_btnDelayPerformBlock setTitle:@"Delay 10sec Perform Block" forState:UIControlStateNormal];
    [_btnDelayPerformBlock addTarget:self action:@selector(actionToOperDelayPerformBlockButton) forControlEvents:UIControlEventTouchUpInside];
    
    return _btnDelayPerformBlock;
}

@end
