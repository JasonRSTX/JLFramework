//
//  JLListInfoModel.h
//  JLFramework
//
//  Created by Jason Li on 2017/3/29.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface JLListInfoModel : NSObject
@property (nonatomic, strong) NSFetchedResultsController *frc;

- (void)initListData:(void(^)(void))completed;

- (void)deletedAllListInfo;

@end
