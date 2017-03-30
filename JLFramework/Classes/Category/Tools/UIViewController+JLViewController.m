//
//  UIViewController+JLViewController.m
//  Pods
//
//  Created by Jason Li on 2017/3/28.
//
//

#import "UIViewController+JLViewController.h"

@implementation UIViewController (JLShowAlert)
- (void)showComingSoon {
    [self showAlertNote:@"Coming Soon!"];
}

- (void)showAlertNote:(NSString *)note {
    [self showAlertNote:note doneTitle:@"OK"];
}

- (void)showAlertNote:(NSString *)note doneTitle:(NSString *)done {
    [self showAlertNote:note doneTitle:done actionHandler:nil];
}

- (void)showAlertNote:(NSString *)note doneTitle:(NSString *)done actionHandler:(void (^)(UIAlertAction *))handler {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@""
                                                                             message:note
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:done style:UIAlertActionStyleCancel handler:handler]];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end


@implementation UIViewController (JLChildController)

- (void)addChildController:(UIViewController *)viewController {
    [self addChildController:viewController frame:CGRectZero];
}

- (void)addChildController:(UIViewController *)viewController frame:(CGRect)frame {
    [self addChildViewController:viewController];
    [viewController.view setFrame:frame];
    [self.view addSubview:viewController.view];
    [viewController didMoveToParentViewController:self];
    
}

@end
