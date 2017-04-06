//
//  JLLayoutVC.m
//  JLFramework
//
//  Created by Jason Li on 2017/4/6.
//  Copyright © 2017年 JasonRSTX. All rights reserved.
//

#import "JLLayoutVC.h"
#import "UIColor+Project.h"
#import "UIFont+Project.h"

@import JLFramework;
@import Masonry;


@interface JLLayoutVC ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UIPickerView *viewPicker;
@property (nonatomic, strong) UIButton *btnShow;
@property (nonatomic, strong) UILabel *labValue;

@end

@implementation JLLayoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.labValue];
    [self.view addSubview:self.btnShow];
    [self.view addSubview:self.viewPicker];
    
    self.labExampleDesc.text = @"将一些基础布局中使用的数据封装成NSObject对象的扩展方法。\n\n项目中使用时可以通过Hook技术更换相关取值。\n";
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.viewPicker selectRow:0 inComponent:0 animated:YES];
    
}

- (void)setupLayoutConstraint {
    [super setupLayoutConstraint];
    
    __weak typeof(self) weakSelf = self;
    [self.labValue mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(make.edgeInsets);
        make.height.mas_equalTo(make.rowHeight);
        
    }];
    
    [self.btnShow mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(weakSelf.labValue);
        make.bottom.mas_equalTo(weakSelf.labValue.mas_top).mas_offset(- make.controlHalfInterval);
        make.height.mas_equalTo(make.rowHeight);
        
    }];
    
    [self.viewPicker mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(weakSelf.view);
        make.bottom.mas_equalTo(weakSelf.btnShow.mas_top).mas_offset(- make.controlHalfInterval);
        make.height.mas_equalTo(make.rowHeight*3.f);
        
    }];
}

//MARK: - Action To Oper
- (void)actionToOperShowButton {
    NSInteger row = [self.viewPicker selectedRowInComponent:0];
    if (row == 0) {
        self.labValue.text = NSStringFromUIEdgeInsets(self.edgeInsets);
    } else {
        NSString *method = [[self.dataSource[row] componentsSeparatedByString:@"."] lastObject];
        self.labValue.text = [NSString stringWithFormat:@"%@",[self valueForKey:method]];
    }
}

//MARK: - Getter And Setter
- (UILabel *)labValue {
    if (_labValue) return _labValue;
    _labValue = [[UILabel alloc] init];
    _labValue.textColor = [UIColor dataColor];
    _labValue.font = [UIFont contentFont];
    _labValue.textAlignment = NSTextAlignmentCenter;
    
    _labValue.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _labValue.layer.borderWidth = 0.5f;
    _labValue.layer.cornerRadius = self.cornerRadius;
    
    return _labValue;
}

- (UIButton *)btnShow {
    if (_btnShow) return _btnShow;
    _btnShow = [self defaultButton];
    
    [_btnShow setTitle:[NSString stringWithFormat:@"Show %@ Value.",[self.dataSource firstObject]] forState:UIControlStateNormal];
    [_btnShow addTarget:self action:@selector(actionToOperShowButton) forControlEvents:UIControlEventTouchUpInside];
    
    return _btnShow;
}

- (UIPickerView *)viewPicker {
    if (_viewPicker) return _viewPicker;
    _viewPicker = [[UIPickerView alloc] init];
    _viewPicker.dataSource = self;
    _viewPicker.delegate = self;
    
    return _viewPicker;
}

- (NSMutableArray *)dataSource {
    if (_dataSource) return _dataSource;
    _dataSource = [NSMutableArray arrayWithCapacity:0];
    
    [_dataSource addObject:@"self.edgeInsets"];
    [_dataSource addObject:@"self.rowHeight"];
    [_dataSource addObject:@"self.navHeight"];
    [_dataSource addObject:@"self.statusBarHeight"];
    [_dataSource addObject:@"self.tabBarHeight"];
    [_dataSource addObject:@"self.controlInterval"];
    [_dataSource addObject:@"self.controlHalfInterval"];
    [_dataSource addObject:@"self.cornerRadius"];
    
    return _dataSource;
}

//MARK: Picker View DataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataSource.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.dataSource[row];
}

//MARK: Picker view Delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return self.rowHeight;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    [_btnShow setTitle:[NSString stringWithFormat:@"Show %@ Value.",self.dataSource[row]] forState:UIControlStateNormal];
}


@end
