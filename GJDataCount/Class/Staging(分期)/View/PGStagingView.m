//
//  PGStagingView.m
//  GJDataCount
//
//  Created by apple on 2017/12/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PGStagingView.h"

@interface PGStagingView ()

/** 分割线1 */
@property (strong, nonatomic) UIView *lineOneVie;
/** 分割线2 */
@property (strong, nonatomic) UIView *lineTwoVie;

@end

@implementation PGStagingView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = WhiteColor;
        [self stagingLayoutView];
    }
    return self;
}

#pragma makr - 创建控件
- (void)stagingLayoutView {
    /** 首付 */
    self.downPayVie = [[CustomCell alloc] init];
    self.downPayVie.cellStyle = ViceTFHorizontalLayoutNotMImgAndNotVImg;
    self.downPayVie.lineStyle = FullScreenLayout;
    self.downPayVie.mainLabel.text = @"首付 ￥";
    self.downPayVie.viceTF.font = [UIFont systemFontOfSize:24];
    self.downPayVie.viceTF.placeholder = @"请输入密码";
    self.downPayVie.viceTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.downPayVie.mvTitleStep = 10;
    [self.downPayVie.mainBtn setHidden:YES];
    [self addSubview:self.downPayVie];
    /** 利率 */
    self.interestLel = [[UILabel alloc] init];
    self.interestLel.text = @"利率";
    [self addSubview:self.interestLel];
    /** 分割线1 */
    self.lineOneVie = [[UIView alloc] init];
    self.lineOneVie.backgroundColor = GrayLineColor;
    [self addSubview:self.lineOneVie];
    /** 银行 */
    self.bankVie = [[CustomCell alloc] init];
    self.bankVie.cellStyle = BigImgVerticallyLayoutNotVImg;
    self.bankVie.lineStyle = CenterLayout;
    self.bankVie.mainLabel.text = @"银行";
    self.bankVie.mainLabel.textColor = BlackColor;
    [self addSubview:self.bankVie];
    /** 分割线2 */
    self.lineTwoVie = [[UIView alloc] init];
    self.lineTwoVie.backgroundColor = GrayLineColor;
    [self addSubview:self.lineTwoVie];
    /** 分期期数 */
    self.termVie = [[PGTermView alloc] init];
    [self addSubview:self.termVie];
    /** 饼图 */
    self.chartVie = [[PieChartView alloc] initWithFrame:CGRectMake(12, 340, 100, 100)];
    self.chartVie.backgroundColor = RedColor;
    [self addSubview:self.chartVie];
    [self.chartVie stroke];
}



#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
    /** 首付 */
    [self.downPayVie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(30);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(@40);
    }];
    /** 利率 */
    [self.interestLel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.downPayVie.mas_bottom).offset(5);
        make.left.equalTo(self.mas_left).offset(12);
    }];
    /** 分割线1 */
    [self.lineOneVie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.downPayVie.mas_bottom).offset(40);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(@10);
    }];
    /** 银行 */
    [self.bankVie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineOneVie.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(@40);
    }];
    /** 分割线2 */
    [self.lineTwoVie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bankVie.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(@10);
    }];
    /** 分期期数 */
    [self.termVie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineTwoVie.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
    }];
}


@end

