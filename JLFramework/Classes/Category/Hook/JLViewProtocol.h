//
//  JLViewProtocol.h
//  Pods
//
//  Created by Jason Li on 2017/3/13.
//
//

#import <Foundation/Foundation.h>

@protocol JLViewProtocol <NSObject>
@optional
- (void)initView;

- (void)setupLayoutConstraint;

- (CGFloat)heightView;

@end

@interface UIView (JLView)<JLViewProtocol>

@end

@interface UITableViewCell (JLView) <JLViewProtocol>

@end

@interface UICollectionViewCell (JLView) <JLViewProtocol>

@end

@interface UIViewController (JLView) <JLViewProtocol>

@end
