//
//  JLBaseViewController.m
//  JLFramework
//
//  Created by Jason Li on 2017/3/31.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLBaseViewController.h"
#import "UIFont+Project.h"
#import "UIColor+Project.h"

@import JLFramework;
@import Masonry;

@interface JLBaseViewController ()

@end

@implementation JLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.labExampleDesc];
    self.view.contentInsets = self.edgeInsets;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupLayoutConstraint {
    __weak typeof(self) weakSelf = self;
    [self.labExampleDesc mas_remakeConstraints:^(MASConstraintMaker *make) {
        if (weakSelf.navigationController.navigationBar.translucent) {
            make.top.mas_equalTo(weakSelf.view).mas_offset(make.edgeInsets.top + make.navHeight);
        } else {
            make.top.mas_equalTo(weakSelf.view).mas_offset(make.edgeInsets.top);
        }
        make.left.right.mas_equalTo(make.edgeInsets);
        make.height.mas_equalTo([weakSelf.labExampleDesc realHeightInView:weakSelf.view]);
        
    }];
}

//MARK: - Getter And Setter
- (UILabel *)labExampleDesc {
    if (_labExampleDesc) return _labExampleDesc;
    _labExampleDesc = [[UILabel alloc] init];
    _labExampleDesc.lineBreakMode = NSLineBreakByWordWrapping;
    _labExampleDesc.numberOfLines = 0;
    _labExampleDesc.font = [UIFont contentFont];
    _labExampleDesc.textColor =  [UIColor grayDataColor];
    
    return _labExampleDesc;
}

- (UIButton *)defaultButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitleColor:[UIColor sportColor] forState:UIControlStateNormal];
    button.layer.borderColor = [UIColor sportColor].CGColor;
    button.layer.borderWidth = 0.5f;
    button.layer.cornerRadius = self.cornerRadius;
    
    return button;
}

@end
