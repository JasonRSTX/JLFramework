//
//  JLListInfoModel.m
//  JLFramework
//
//  Created by Jason Li on 2017/3/29.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLListInfoModel.h"
#import "ListInfo+CoreDataClass.h"
#import "JLListInfoModel+DataSource.h"

@import JLFramework;

@interface JLListInfoModel ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSFetchRequest *requestAllByShowCount;
@property (nonatomic, strong) NSEntityDescription *entityListInfo;

@end

@implementation JLListInfoModel

- (void)initListData:(void (^)(void))completed {
    if ([[CDManager sharedInstance] countForRequest:self.requestAllByShowCount] == 0) {
        [self insertDatas];
    } else {
        NSArray *result = [[CDManager sharedInstance] resultsForRequest:self.requestAllByShowCount];
        
        NSMutableArray *filterArray = [NSMutableArray arrayWithCapacity:0];
        // 从本地数据库中修改和删除数据
        for (ListInfo *info in result) {
            NSArray *nowData = [self.dataSource filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"exampleID = %@",info.exampleID]];
            if (nowData.count > 0) {
                [filterArray addObject:[nowData firstObject][@"exampleID"]];
                if ([[nowData firstObject][@"lastUpdateTime"] compare:info.lastUpdateTime] == NSOrderedDescending) {
                    [info setValuesForKeysWithDictionary:[nowData firstObject]];
                    if (![[CDManager sharedInstance] saveWithManagedObject:info]) {
                        NSLog(@"%@ 数据更新失败！", info.title);
                    }
                }
            } else {
                if ([[CDManager sharedInstance] deleteWithManagedObject:info]) {
                    NSLog(@"%@ 数据删除成功！", info.title);
                }
            }
        }
        
        // 向本地数据库中添加增量
        NSArray *insertArray = [self.dataSource filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"NOT (exampleID in %@)",filterArray]];
        for (NSDictionary *dict in insertArray) {
            ListInfo *info = (ListInfo *)[[CDManager sharedInstance] insertWithEntityName:@"ListInfo"];
            [info setValuesForKeysWithDictionary:dict];
            if ([[CDManager sharedInstance] saveWithManagedObject:info]) {
                NSLog(@"%@ 数据插入成功！", dict[@"title"]);
            }
        }
    }
    
    if (completed) {
        completed();
    }
}

- (void)insertDatas {
    for (NSDictionary *dict in self.dataSource) {
        ListInfo *info = (ListInfo *)[[CDManager sharedInstance] insertWithEntityName:@"ListInfo"];
        [info setValuesForKeysWithDictionary:dict];
        [[CDManager sharedInstance] saveWithManagedObject:info];
    }
}

- (void)deletedAllListInfo {
    if (![[CDManager sharedInstance] deleteWithRequet:self.requestAllByShowCount]) {
        NSLog(@"ListInfo 表数据已经全部清除！");
    }
}

//MARK: - Getter And Setter
- (NSEntityDescription *)entityListInfo {
    if (_entityListInfo) return _entityListInfo;
    _entityListInfo = [[CDManager sharedInstance] entityWithName:@"ListInfo"];
    
    return _entityListInfo;
}

- (NSFetchRequest *)requestAllByShowCount {
    if (_requestAllByShowCount) return _requestAllByShowCount;
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"showCount" ascending:YES];
    
    _requestAllByShowCount = [[CDManager sharedInstance] requestWithEntity:self.entityListInfo predicate:nil sortDescriptor:@[descriptor]];
    
    return _requestAllByShowCount;
}

- (NSFetchedResultsController *)frc {
    if (_frc) return _frc;
    _frc = [[NSFetchedResultsController alloc] initWithFetchRequest:self.requestAllByShowCount managedObjectContext:[CDManager sharedInstance].dataContext sectionNameKeyPath:nil cacheName:nil];
    
    return _frc;
}

- (NSMutableArray *)dataSource {
    if (_dataSource) return _dataSource;
    _dataSource = [NSMutableArray arrayWithCapacity:0];
    
    [_dataSource addObject:[self keyValueExample]];
    [_dataSource addObject:[self jlInitExample]];
    [_dataSource addObject:[self safeAccessSuscriptExample]];
    [_dataSource addObject:[self arrayShuffleExample]];
    [_dataSource addObject:[self keyboardMoveExample]];
    [_dataSource addObject:[self layoutExample]];
    [_dataSource addObject:[self performBlockExample]];
    [_dataSource addObject:[self userDefalutExample]];
    [_dataSource addObject:[self stringToolsExample]];
    
    return _dataSource;
}

@end
