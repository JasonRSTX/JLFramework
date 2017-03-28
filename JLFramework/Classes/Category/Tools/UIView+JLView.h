//
//  UIView+JLView.h
//  Pods
//
//  Created by Jason Li on 2017/3/27.
//
//

#import <UIKit/UIKit.h>

@interface UIView (JLViewFrame)
@property (nonatomic, assign) UIEdgeInsets contentInsets;

@property (nonatomic, assign) CGFloat view_x;
@property (nonatomic, assign) CGFloat view_y;
@property (nonatomic, assign) CGFloat view_width;
@property (nonatomic, assign) CGFloat view_height;
@property (nonatomic, assign) CGSize view_size;
@property (nonatomic, assign) CGPoint view_origin;

@end
