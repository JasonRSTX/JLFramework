//
//  JLExampleCell.m
//  JLFramework
//
//  Created by Jason Li on 2017/3/29.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLExampleCell.h"

#import "UIFont+Project.h"
#import "UIColor+Project.h"
#import "ListInfo+CoreDataClass.h"

@import JLFramework;
@import Masonry;

@interface JLExampleCell ()
@property (nonatomic, strong) UILabel *labTitle;
@property (nonatomic, strong) UILabel *labUpdateTime;
@property (nonatomic, strong) UILabel *labDesc;

@end

@implementation JLExampleCell
- (CGFloat)heightView {
    CGFloat height = CGFLOAT_MIN;
    
    height += self.contentInsets.top;
    height += [self.labTitle.font lineHeight];
    height += self.controlHalfInterval;
    height += [self.labDesc realHeightInView:self.contentView atInsets:self.contentInsets];
    height += self.contentInsets.bottom;
    
    return ceilf(height);
}

- (void)setInfo:(ListInfo *)info {
    _info = info;
    self.labTitle.text = info.title;
    self.labUpdateTime.text = info.lastUpdateTime;
    
    self.labDesc.text = info.desc;
}

//MARK: - Life Cycle
- (void)initView {
    [self.contentView addSubview:self.labTitle];
    [self.contentView addSubview:self.labUpdateTime];
    [self.contentView addSubview:self.labDesc];
    
    self.contentInsets = self.edgeInsets;
}

- (void)setupLayoutConstraint {
    __weak typeof(self) weakSelf = self;
    [self.labTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(weakSelf.contentInsets);
        make.right.mas_equalTo(weakSelf.labUpdateTime.mas_left).mas_offset(-make.controlInterval);
        make.height.mas_equalTo([weakSelf.labTitle.font lineHeight]);
    }];
    
    [self.labUpdateTime mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(weakSelf.contentInsets);
        make.left.mas_equalTo(weakSelf.labTitle.mas_right).mas_offset(make.controlInterval);
        make.size.mas_equalTo([weakSelf.labUpdateTime simpleSize]);
    }];
    
    [self.labDesc mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(weakSelf.contentInsets);
        make.top.mas_equalTo(weakSelf.labTitle.mas_bottom).mas_offset(make.controlHalfInterval);
        
    }];
}

//MARK: - Getter And Setter
- (UILabel *)labTitle {
    if (_labTitle) return _labTitle;
    _labTitle = [[UILabel alloc] init];
    [_labTitle setFont:[UIFont titleFont]];
    _labTitle.textColor = [UIColor dataColor];
    
    return _labTitle;
}

- (UILabel *)labUpdateTime {
    if (_labUpdateTime) return _labUpdateTime;
    _labUpdateTime = [[UILabel alloc] init];
    _labUpdateTime.font = [UIFont descFont];
    _labUpdateTime.textColor = [UIColor sportColor];
    
    return _labUpdateTime;
}

- (UILabel *)labDesc {
    if (_labDesc) return _labDesc;
    _labDesc = [[UILabel alloc] init];
    _labDesc.font = [UIFont descFont];
    _labDesc.textColor = [UIColor grayDataColor];
    _labDesc.numberOfLines = 0;
    _labDesc.lineBreakMode = NSLineBreakByWordWrapping;
    
    return _labDesc;
}

@end
