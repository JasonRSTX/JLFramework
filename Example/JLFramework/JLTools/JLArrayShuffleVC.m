//
//  JLArrayShuffleVC.m
//  JLFramework
//
//  Created by Jason Li on 2017/4/1.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLArrayShuffleVC.h"

@import JLFramework;
@import Masonry;

@interface JLArrayShuffleVC ()
@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) UIButton *btnShuffle;

@end

@implementation JLArrayShuffleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self actionToShowDataSource];
    
    [self.view addSubview:self.btnShuffle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupLayoutConstraint {
    [super setupLayoutConstraint];
    
    [self.btnShuffle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(make.edgeInsets);
        make.height.mas_equalTo(make.rowHeight);
    }];
}

//MARK: - Action To Oper
- (void)actionToOperShuffleButton {
    self.dataSource = [self.dataSource shuffle];
    [self actionToShowDataSource];
}

- (void)actionToShowDataSource {
    NSString *show = @"数组元素位置混淆：";
    
    for (NSString *string in self.dataSource) {
        show = [NSString stringWithFormat:@"%@\n%@",show,string];
    }
    
    self.labExampleDesc.text = show;
}

//MARK: - Getter And Setter
- (NSArray *)dataSource {
    if (_dataSource) return _dataSource;
    _dataSource = @[@"1",@"2",@"3",@"4",@"5"];
    
    return _dataSource;
}

- (UIButton *)btnShuffle {
    if (_btnShuffle) return _btnShuffle;
    _btnShuffle = [self defaultButton];
    
    [_btnShuffle setTitle:@"Shuffle" forState:UIControlStateNormal];
    [_btnShuffle addTarget:self action:@selector(actionToOperShuffleButton) forControlEvents:UIControlEventTouchUpInside];
    
    return _btnShuffle;
}

@end
