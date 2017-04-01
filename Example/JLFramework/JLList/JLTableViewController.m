//
//  JLTableViewController.m
//  JLFramework
//
//  Created by Jason Li on 2017/3/28.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLTableViewController.h"
#import "JLListInfoModel.h"
#import "ListInfo+CoreDataClass.h"

#import "JLExampleCell.h"
static NSString *ExampleCellIdentifier = @"ExampleCellIdentifier";

@import JLFramework;

@interface JLTableViewController ()
@property (nonatomic, strong) JLListInfoModel *modelList;
@property (nonatomic, strong) JLExampleCell *sizingCell;

@end

@implementation JLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"JLFramework";
    
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView registerClass:[JLExampleCell class] forCellReuseIdentifier:ExampleCellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    __weak typeof(self) weakSelf = self;
    [self.modelList initListData:^{
        [weakSelf actionToOperReloadLocalDat];
    }];
    
}

//MARK: - Action To Oper
- (void)actionToOperReloadLocalDat {
    NSError *error = nil;
    if (![self.modelList.frc performFetch:&error]) {
        NSLog(@"Failed to perform fetch: %@",error);
    }
    [self.tableView reloadData];
}

//MARK: - Getter And Setter
- (JLListInfoModel *)modelList {
    if (_modelList) return _modelList;
    _modelList = [[JLListInfoModel alloc] init];
    _modelList.frc.delegate = self;
    
    return _modelList;
}

- (JLExampleCell *)sizingCell {
    if (_sizingCell) return _sizingCell;
    _sizingCell = [[JLExampleCell alloc] init];
    
    return _sizingCell;
}

//MARK: Table View Config Cell
- (void)fetchedConfigCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    JLExampleCell *dCell = (JLExampleCell *)cell;
    dCell.info = [self.modelList.frc objectAtIndexPath:indexPath];
    
}

//MARK: Table View DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.modelList.frc sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JLExampleCell *cell = [tableView dequeueReusableCellWithIdentifier:ExampleCellIdentifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [self fetchedConfigCell:cell atIndexPath:indexPath];
    
    return cell;
}

//MARK: table view Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.sizingCell.info = [self.modelList.frc objectAtIndexPath:indexPath];
    return [self.sizingCell heightView];
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ListInfo *info = [self.modelList.frc objectAtIndexPath:indexPath];
    UIViewController *vc = (UIViewController *)[[NSClassFromString(info.landingVC) alloc] init];
    vc.title = info.title;
    [self.navigationController pushViewController:vc animated:YES];

}

@end
