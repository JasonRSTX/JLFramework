//
//  JLStringToolsVC.m
//  JLFramework
//
//  Created by Jason Li on 2017/4/21.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLStringToolsVC.h"
#import "JLStringToolsTableVC.h"

@import JLFramework;
@import Masonry;

@interface JLStringToolsVC ()
@property (nonatomic, strong) JLStringToolsTableVC *tableVC;

@end

@implementation JLStringToolsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildController:self.tableVC];
}

- (void)setupLayoutConstraint {
    __weak typeof(self) weakSelf = self;
    [self.tableVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakSelf.view);
    }];
    
}

//MARK: - Getter And Setter
- (JLStringToolsTableVC *)tableVC {
    if (_tableVC) return _tableVC;
    _tableVC = [[JLStringToolsTableVC alloc] initWithStyle:UITableViewStylePlain];
    
    return _tableVC;
}

@end
