//
//  JLViewController.m
//  JLFramework
//
//  Created by JasonRSTX on 03/13/2017.
//  Copyright (c) 2017 JasonRSTX. All rights reserved.
//

#import "JLViewController.h"
#import "JLTableViewController.h"

@import Masonry;
@import JLFramework;

@interface JLViewController ()
@property (nonatomic, strong) UINavigationController *navVC;
@property (nonatomic, strong) JLTableViewController *tableViewVC;

@end

@implementation JLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self addChildController:self.navVC];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupLayoutConstraint {
    __weak typeof(self) weakSelf = self;
    [self.navVC.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(weakSelf.view);
    }];

}

//MARK: - Getter And Setter
- (UINavigationController *)navVC {
    if (_navVC) return _navVC;
    _navVC = [[UINavigationController alloc] initWithRootViewController:self.tableViewVC];
    
    return _navVC;
}

- (JLTableViewController *)tableViewVC {
    if (_tableViewVC) return _tableViewVC;
    _tableViewVC = [[JLTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    return _tableViewVC;
}

@end
