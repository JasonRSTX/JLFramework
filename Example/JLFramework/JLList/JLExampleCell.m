//
//  JLExampleCell.m
//  JLFramework
//
//  Created by Jason Li on 2017/3/29.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLExampleCell.h"

@import JLFramework;

@interface JLExampleCell ()
@property (nonatomic, strong) UILabel *labTitle;
@property (nonatomic, strong) UILabel *labShowTime;
@property (nonatomic, strong) UILabel *labDesc;

@end

@implementation JLExampleCell

- (void)initView {
    
}

//MARK: - Getter And Setter
- (UILabel *)labTitle {
    if (_labTitle) return _labTitle;
    _labTitle = [[UILabel alloc] init];

    
    return _labTitle;
}

@end
