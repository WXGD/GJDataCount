//
//  PGQuickTermView.m
//  GJDataCount
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PGQuickTermView.h"

@implementation PGQuickTermView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self quickTermLayoutView];
    }
    return self;
}

#pragma makr - 创建控件
- (void)quickTermLayoutView {
    /** 筛选条件按钮 */
    self.quickTermBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.quickTermBtn.titleLabel.font = TwelveTypeface;
    self.quickTermBtn.normalTitleColor = BlackColor;
    self.quickTermBtn.selectedTitleColor = WhiteColor;
    self.quickTermBtn.backgroundColor = GrayVCColor;
    self.quickTermBtn.layer.masksToBounds = YES;
    self.quickTermBtn.layer.cornerRadius = 12;
    [self addSubview:self.quickTermBtn];
}



#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
    @weakify(self)
    [self.quickTermBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.mas_top);
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom);
        if (self.width >= 90) {
            make.width.mas_equalTo(@90);
        }else {
            make.width.mas_equalTo(self.width);
        }
    }];
}


@end
