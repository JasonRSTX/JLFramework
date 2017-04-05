//
//  UIViewController+JLViewController.h
//  Pods
//
//  Created by Jason Li on 2017/3/28.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIViewController (JLShowAlert)

- (void)showComingSoon NS_AVAILABLE_IOS(8_0);
- (void)showAlertNote:(nullable NSString *)note NS_AVAILABLE_IOS(8_0);
- (void)showAlertNote:(NSString *)note doneTitle:(NSString *)done NS_AVAILABLE_IOS(8_0);
- (void)showAlertNote:(NSString *)note doneTitle:(NSString *)done actionHandler:(void (^)(UIAlertAction *action))handler NS_AVAILABLE_IOS(8_0);

@end

@interface UIViewController (JLChildController)
/**
 向ViewController添加ChildController，ChildController视图Frame默认为CGRectZero，需要自行布局

 @param viewController ChildController
 */
- (void)addChildController:(UIViewController *)viewController;
- (void)addChildController:(UIViewController *)viewController frame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
