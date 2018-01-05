//
//  PGverqQuickView.m
//  GJDataCount
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PGQuickScreenView.h"

@implementation PGQuickScreenView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = WhiteColor;
        [self quickScreenLayoutView];
    }
    return self;
}

#pragma makr - set方法
/** 快捷筛选条件 */
- (void)setQuickScreenAry:(NSMutableArray *)quickScreenAry {
    _quickScreenAry = quickScreenAry;
    // 纵向数据
    for (int i = 0; i <= quickScreenAry.count / 3; i++) {
        /** 快捷筛选条件view（横向） */
        UIStackView *horQuickVie = [[UIStackView alloc] init];
        horQuickVie.axis = UILayoutConstraintAxisHorizontal;
        horQuickVie.distribution = UIStackViewDistributionFillEqually;
        horQuickVie.alignment = UIStackViewAlignmentFill;
        horQuickVie.spacing = 30;
        [self.verQuickVie addSubview:horQuickVie];
        /** 快捷筛选条件view（横向） */
        [horQuickVie mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(40);
        }];

        
        if (i == quickScreenAry.count / 3) {
            for (int i = 0; i < quickScreenAry.count % 3; i++) {

                PGQuickTermView *termBtn = [[PGQuickTermView alloc] init];
                termBtn.size = CGSizeMake(90, 25);
                [horQuickVie addArrangedSubview:termBtn];
            }
        }else {
            for (int i = 0; i < 3; i++) {
                
                PGQuickTermView *termBtn = [[PGQuickTermView alloc] init];
                [horQuickVie addArrangedSubview:termBtn];
            }
        }
        
     
    }
    @weakify(self)
    /** 快捷筛选条件view（纵向） */
    [self.verQuickVie mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(40 * (quickScreenAry.count / 3 + 1));
    }];
    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.bottom.equalTo(self.verQuickVie.mas_bottom);
    }];

}


#pragma makr - 创建控件
- (void)quickScreenLayoutView {
    /** 快捷筛选条件view（纵向） */
    self.verQuickVie = [[UIStackView alloc] init];
    self.verQuickVie.axis = UILayoutConstraintAxisVertical;
    self.verQuickVie.alignment = UIStackViewAlignmentFill;
    self.verQuickVie.distribution = UIStackViewDistributionFillEqually;
    [self addSubview:self.verQuickVie];
}



#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
//    @weakify(self)
//    /** 快捷筛选条件view（纵向） */
//    [self.verQuickVie mas_makeConstraints:^(MASConstraintMaker *make) {
//        @strongify(self)
//        make.top.equalTo(self.mas_top);
//        make.left.equalTo(self.mas_left);
//        make.right.equalTo(self.mas_right);
//        make.height.mas_equalTo(40);
//    }];
//    /** 快捷筛选条件view（横向） */
//    [self.horQuickVie mas_makeConstraints:^(MASConstraintMaker *make) {
//        @strongify(self)
//        make.top.equalTo(self.mas_top).offset(7);
//        make.left.equalTo(self.mas_left).offset(20);
//        make.right.equalTo(self.mas_right).offset(-20);
//        make.bottom.equalTo(self.mas_bottom).offset(-7);
//    }];
//    /** self */
//    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
//        @strongify(self)
//        make.bottom.equalTo(self.verQuickVie.mas_bottom);
//    }];
}

@end
