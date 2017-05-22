//
//  UITableViewController+JLCoreData.h
//  Pods
//
//  Created by Jason Li on 2017/3/28.
//
//

@import UIKit;
@import CoreData;

@protocol JLCoreDataFetchedConfigCellProtocol <NSObject>
@optional
/**
 CoreData刷新Cell时调用该协议，实现Cell数据的刷新

 @param cell 指定的Cell对象
 @param indexPath 需要刷新的indexPath
 */
- (void)fetchedConfigCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@interface UITableViewController (JLCoreData) <NSFetchedResultsControllerDelegate,JLCoreDataFetchedConfigCellProtocol>

@end
