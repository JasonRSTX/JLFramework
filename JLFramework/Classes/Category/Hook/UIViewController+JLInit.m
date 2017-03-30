//
//  UIViewController+JLInit.m
//  Pods
//
//  Created by Jason Li on 2017/3/28.
//
//

#import "UIViewController+JLInit.h"
#import "JLViewProtocol.h"

@import JRSwizzle;

@implementation UIViewController (JLInit)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSError *error;
        BOOL result = result = [[self class] jr_swizzleMethod:@selector(viewWillLayoutSubviews) withMethod:@selector(jl_viewWillLayoutSubviews) error:&error];
        if (!result || error) {
            NSLog(@"Can't swizzle methods - %@", [error description]);
        }
    });
}

- (void)jl_viewWillLayoutSubviews {
    [self jl_viewWillLayoutSubviews];
    
    if ([self respondsToSelector:@selector(setupLayoutConstraint)]) {
        [self setupLayoutConstraint];
    }
}

@end
