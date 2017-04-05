//
//  JLInitVC.m
//  JLFramework
//
//  Created by Jason Li on 2017/4/1.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLInitVC.h"
#import "JLInitView.h"
#import "UIColor+Project.h"
#import "UIFont+Project.h"

@import JLFramework;
@import Masonry;

@interface JLInitVC ()
@property (nonatomic, strong) JLInitView *viewInit;

@end

@implementation JLInitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.viewInit];
    
    self.labExampleDesc.text = @"JLInit 是一组 编码习惯，主要包含实现了JLViewProtocol的对象\nUIView\nUITableViewCell\nUICollectionViewCell\nUIViewController\n\n特点:\n使用时导入相应对象的Category或@import JLFramework;即可";
    
    NSRange range = [self.labExampleDesc.text rangeOfString:@"编码习惯"];
    [self.labExampleDesc addAttributeColor:[UIColor sportColor] ragne:range];
    [self.labExampleDesc addAttributeFont:[UIFont titleFont] ragne:range];
}

- (void)setupLayoutConstraint {
    [super setupLayoutConstraint];
    
    __weak typeof(self) weakSelf = self;
    [self.viewInit mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(make.edgeInsets);
        
        if (CGRectGetWidth(weakSelf.view.bounds)/1.6f > CGRectGetHeight([UIScreen mainScreen].bounds)) {
            make.height.mas_equalTo(weakSelf.viewInit.mas_width).multipliedBy(0.2f);
        } else {
            make.height.mas_equalTo(weakSelf.viewInit.mas_width).dividedBy(1.6f);
        }
        
    }];
}

//MARK: - Getter And Setter
- (JLInitView *)viewInit {
    if (_viewInit) return _viewInit;
    _viewInit = [[JLInitView alloc] init];
    _viewInit.backgroundColor = [UIColor redColor];
    
    return _viewInit;
}


@end
