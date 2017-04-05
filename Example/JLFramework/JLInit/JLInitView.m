//
//  JLInitView.m
//  JLFramework
//
//  Created by Jason Li on 2017/4/1.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLInitView.h"
#import "UIColor+Project.h"
#import "UIFont+Project.h"

@import JLFramework;
@import Masonry;

@interface JLInitView ()
@property (nonatomic, strong) UILabel *labNote;

@end

@implementation JLInitView

- (void)initView {
    [self addSubview:self.labNote];
    
}

- (void)setupLayoutConstraint {
    [self.labNote mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(make.edgeInsets);
    }];
    
}

//MARK: - Getter And Setter
- (UILabel *)labNote {
    if (_labNote) return _labNote;
    _labNote = [[UILabel alloc] init];
    _labNote.textColor = [UIColor dataColor];
    _labNote.font = [UIFont descFont];
    _labNote.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _labNote.numberOfLines = 0;
    _labNote.layer.cornerRadius = self.cornerRadius;
    _labNote.text = @"-initView方法中组织添加控件\n-setupLayoutConstraint方法中设置控件约束\n-heightView方法中计算自身高度";
    
    return _labNote;
}



@end
