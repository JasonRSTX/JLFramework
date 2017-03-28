//
//  JLCoreDataManager.m
//  Pods
//
//  Created by Jason Li on 2017/3/27.
//
//

#import "JLCoreDataManager.h"

@interface JLCoreDataManager()
@property (nonatomic, strong) NSString *storeName;  //sqlite文件名称，同modelName

@end

@implementation JLCoreDataManager
@synthesize dataContext = _dataContext;
@synthesize dataModel = _dataModel;
@synthesize dataCoordinator = _dataCoordinator;

+ (instancetype)sharedManager {
    static dispatch_once_t onceInstance;
    static CDManager *instance;
    dispatch_once(&onceInstance, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (NSEntityDescription *)entityWithName:(NSString *)name {
    return [NSEntityDescription entityForName:name
                       inManagedObjectContext:self.dataContext];
}

//MARK: - Application's Documents directory
// Returns the URL to the application's Documents directory.
- (NSURL *)documentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                   inDomains:NSUserDomainMask]
            lastObject];
    
}

//MARK: - Getter And Setter
- (NSString *)modelName {
    if (_modelName) return _modelName;
    _modelName = @"JLCoreData";
    
    return _modelName;
}

- (NSString *)storeName {
    return [NSString stringWithFormat:@"%@.sqlite",self.modelName];
}

- (NSManagedObjectModel *)dataModel {
    if (_dataModel) return _dataModel;
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:self.modelName
                                              withExtension:@"momd"];
    _dataModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return _dataModel;
}

- (NSPersistentStoreCoordinator *)dataCoordinator {
    if (_dataCoordinator) return _dataCoordinator;
    
    NSURL *storeURL = [[self documentsDirectory]
                       URLByAppendingPathComponent:self.storeName];
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES],
                             NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES],
                             NSInferMappingModelAutomaticallyOption, nil];
    
    NSError *error = nil;
    _dataCoordinator = [[NSPersistentStoreCoordinator alloc]
                        initWithManagedObjectModel:[self dataModel]];
    
    if (![_dataCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                        configuration:nil
                                                  URL:storeURL
                                              options:options
                                                error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _dataCoordinator;
}

- (NSManagedObjectContext *)dataContext {
    if (_dataCoordinator) return _dataCoordinator;
    NSPersistentStoreCoordinator *coordinator = [self dataCoordinator];
    if (coordinator != nil) {
        _dataContext = [[NSManagedObjectContext alloc]
                        initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_dataContext setPersistentStoreCoordinator:coordinator];
    }
    
    return _dataCoordinator;
}

//MARK: - 插入
- (NSManagedObject *)insertWithEntityName:(NSString *)name {
    return [NSEntityDescription insertNewObjectForEntityForName:name
                                         inManagedObjectContext:self.dataContext];
    
}

//MARK: - 删除
- (BOOL)deleteWithRequet:(NSFetchRequest *)request {
    NSArray *results = [self resultsForRequest:request];
    
    if (results) {
        for (NSManagedObject *obj in results) {
            [self.dataContext deleteObject:obj];
        }
        return [self saveContext];
    }
    
    return NO;
    
}

- (BOOL)deleteWithManagedObject:(NSManagedObject *)object {
    if (object) {
        [self.dataContext deleteObject:object];
        return [self saveWithManagedObject:object];
    }
    return NO;
}

//MARK: - 修改&保存
- (BOOL)updateWithManagedObject:(NSManagedObject *)object {
    if (!object) {
        return NO;
    }
    [self.dataContext refreshObject:object mergeChanges:YES];
    return [self saveWithManagedObject:object];
    
}

- (BOOL)saveContext {
    BOOL success = YES;
    NSError *error;
    if (![self.dataContext save:&error]) {
        NSLog(@"%s : Unresolved error %@, %@",
              __func__,
              error,
              [error userInfo]);
        
        abort();
        success = NO;
    }
    return success;
}

- (BOOL)saveWithManagedObject:(NSManagedObject *)object {
    BOOL success = YES;
    NSError *error;
    
    if (![object.managedObjectContext save:&error]) {
        NSLog(@"%s : Unresolved error %@, %@", __func__, error, [error userInfo]);
        abort();
        success = NO;
    }
    return success;
}

@end
