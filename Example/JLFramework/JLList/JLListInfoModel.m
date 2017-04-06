//
//  JLListInfoModel.m
//  JLFramework
//
//  Created by Jason Li on 2017/3/29.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLListInfoModel.h"
#import "ListInfo+CoreDataClass.h"

@import JLFramework;

@interface JLListInfoModel ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSFetchRequest *requestAllByShowCount;
@property (nonatomic, strong) NSEntityDescription *entityListInfo;

@end

@implementation JLListInfoModel

- (void)initListData:(void (^)())completed {
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
    
    return _dataSource;
}

- (NSDictionary *)keyValueExample {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setValue:@"JLKeyValue" forKey:@"exampleID"];
    [dict setValue:@"NSObject+JLKeyValue" forKey:@"title"];
    [dict setValue:@"Avoid Crash:使用原生的NSKeyValueCoding中\n-setValuesForKeysWithDictionary:方法." forKey:@"desc"];
    [dict setValue:@"JLKeyValueVC" forKey:@"landingVC"];
    [dict setValue:@"20170331" forKey:@"lastUpdateTime"];
    
    return dict;
}

- (NSDictionary *)jlInitExample {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setValue:@"JLInit" forKey:@"exampleID"];
    [dict setValue:@"JLInit" forKey:@"title"];
    [dict setValue:@"Coding Style:使用-initView方法进行控件统一加载，使用-setupLayoutConstraint进行控件的统一布局" forKey:@"desc"];
    [dict setValue:@"JLInitVC" forKey:@"landingVC"];
    [dict setValue:@"20170401" forKey:@"lastUpdateTime"];
    
    return dict;
}

- (NSDictionary *)safeAccessSuscriptExample {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setValue:@"JLSafeAccessSubscript" forKey:@"exampleID"];
    [dict setValue:@"NSNull|NSString subscript" forKey:@"title"];
    [dict setValue:@"Avoid Crash:规避字典和数组中使用角标连续访问Crash问题" forKey:@"desc"];
    [dict setValue:@"JLSubscriptVC" forKey:@"landingVC"];
    [dict setValue:@"20170401" forKey:@"lastUpdateTime"];
    
    return dict;
}

- (NSDictionary *)arrayShuffleExample {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setValue:@"Shuffle" forKey:@"exampleID"];
    [dict setValue:@"NSArray Shuffle" forKey:@"title"];
    [dict setValue:@"Tools:对数组元素进行混淆处理" forKey:@"desc"];
    [dict setValue:@"JLArrayShuffleVC" forKey:@"landingVC"];
    [dict setValue:@"20170401" forKey:@"lastUpdateTime"];
    
    return dict;
}

- (NSDictionary *)keyboardMoveExample {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setValue:@"Keyboard" forKey:@"exampleID"];
    [dict setValue:@"Keyboard Move" forKey:@"title"];
    [dict setValue:@"Tools:键盘唤醒和收起后对视图的移动操作。" forKey:@"desc"];
    [dict setValue:@"JLKeyboardVC" forKey:@"landingVC"];
    [dict setValue:@"20170405" forKey:@"lastUpdateTime"];
    
    return dict;
}

- (NSDictionary *)layoutExample {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setValue:@"Layout" forKey:@"exampleID"];
    [dict setValue:@"Default Layout Value" forKey:@"title"];
    [dict setValue:@"Tools:针对布局的相关默认数据，直接通过self.即可使用。" forKey:@"desc"];
    [dict setValue:@"JLLayoutVC" forKey:@"landingVC"];
    [dict setValue:@"20170406" forKey:@"lastUpdateTime"];
    
    return dict;
}

@end
