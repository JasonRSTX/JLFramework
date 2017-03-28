//
//  UIDevice+JLDevice.m
//  Pods
//
//  Created by Jason Li on 2017/3/27.
//
//

#import "UIDevice+JLDevice.h"

@implementation UIDevice (JLDevice)
/**
 * 由于CGFloat 转换systemVersion之后，存在精度问题（9.2 = 9.1999998），无法直接用于比较，因此转换为 NSNumber 之后 通过 compare 进行版本比对
 **/
+ (BOOL)currentSystemVersionLessThan:(CGFloat)targetVersion {
    //保留小数点后1位 ,只舍不入
    NSDecimalNumberHandler *roundDown = [NSDecimalNumberHandler
                                         decimalNumberHandlerWithRoundingMode:NSRoundDown
                                         scale:1
                                         raiseOnExactness:NO
                                         raiseOnOverflow:NO
                                         raiseOnUnderflow:NO
                                         raiseOnDivideByZero:YES];
    
    NSDecimalNumber *current  = [[NSDecimalNumber decimalNumberWithString:[[UIDevice currentDevice] systemVersion]] decimalNumberByRoundingAccordingToBehavior:roundDown];
    NSDecimalNumber *target = [[NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",targetVersion]] decimalNumberByRoundingAccordingToBehavior:roundDown];
    
    if ([current compare:target] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}

@end
