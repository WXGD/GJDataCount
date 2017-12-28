//
//  PGTermView.m
//  GJDataCount
//
//  Created by apple on 2017/12/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PGTermView.h"

@interface PGTermView ()

/** 分割线 */
@property (strong, nonatomic) UIView *lineVie;

@end


@implementation PGTermView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self stagingLayoutView];
    }
    return self;
}

#pragma makr - 创建控件
- (void)stagingLayoutView {
    /** 分割线1 */
    self.lineVie = [[UIView alloc] init];
    self.lineVie.backgroundColor = GrayLineColor;
    [self addSubview:self.lineVie];
}



#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
    /** 分割线 */
    [self.lineVie mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(@0.5);
    }];
    /** self */
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@110);
    }];
}


@end
