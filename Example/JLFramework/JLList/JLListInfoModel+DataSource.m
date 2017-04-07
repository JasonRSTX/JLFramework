//
//  JLListInfoModel+DataSource.m
//  JLFramework
//
//  Created by Jason Li on 2017/4/6.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLListInfoModel+DataSource.h"

@implementation JLListInfoModel (DataSource)

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

- (NSDictionary *)performBlockExample {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setValue:@"PerformBlock" forKey:@"exampleID"];
    [dict setValue:@"Delay Perform Block" forKey:@"title"];
    [dict setValue:@"Tools:Block的延期执行。" forKey:@"desc"];
    [dict setValue:@"JLPerformBlockVC" forKey:@"landingVC"];
    [dict setValue:@"20170406" forKey:@"lastUpdateTime"];
    
    return dict;
}

- (NSDictionary *)userDefalutExample {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setValue:@"UserDefault" forKey:@"exampleID"];
    [dict setValue:@"Simple UserDefault" forKey:@"title"];
    [dict setValue:@"Tools:简化NSUserDefault读取和存储。" forKey:@"desc"];
    [dict setValue:@"JLUserDefaultVC" forKey:@"landingVC"];
    [dict setValue:@"20170407" forKey:@"lastUpdateTime"];
    
    return dict;
}

@end
