//
//  PGActivityView.m
//  GJDataCount
//
//  Created by apple on 2017/12/1.
//  Copyright © 2017年 apple. All rights reserved.
//

/** 10号字 */
#define TenTypeface [UIFont systemFontOfSize:10]


#import "PGActivityView.h"

@implementation PGActivityView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = WhiteColor;
        [self activityLayoutView];
    }
    return self;
}


#pragma makr - set方法
- (void)setActivityAry:(NSArray *)activityAry {
    _activityAry = activityAry;
    // 保存字符x值
    CGFloat strX = 0;
    CGFloat strY = 0;
    CGFloat strH = 16;
    // 是否分期
    if (self.isStagesBol) {
        // 计算字符宽度
        CGSize stageSiz = [self computeCharacterize:@"可分期" font:TenTypeface swellSize:CGSizeMake(8, 4)];
        // 创建控件
        UILabel *stageLel = [[UILabel alloc] init];
        stageLel.x = strX;
        stageLel.y = strY;
        stageLel.height = strH;
        stageLel.width = stageSiz.width;
        stageLel.text = @"可分期";
        stageLel.font = TenTypeface;
        stageLel.textColor = ThemeColor;
        stageLel.textAlignment = NSTextAlignmentCenter;
        stageLel.backgroundColor = [UIColor colorWithRed:229 / 255.0 green:175 / 255.0 blue:246 / 255.0 alpha:1];
        stageLel.layer.masksToBounds = YES;
        stageLel.layer.cornerRadius = 3;
        [self addSubview:stageLel];
        // 计算保存下一个x值
        strX = strX + stageLel.width + 5;
        // self高度
        self.height = strY + strH;
    }
    // 便利活动数组
    for (NSString *activityStr in activityAry) {
        // 计算字符宽度
        CGSize activitySiz = [self computeCharacterize:activityStr font:TenTypeface swellSize:CGSizeMake(8, 4)];
        // 创建控件
        UILabel *activityLel = [[UILabel alloc] init];
        activityLel.x = strX;
        activityLel.y = strY;
        activityLel.height = strH;
        activityLel.width = activitySiz.width;
        activityLel.text = activityStr;
        activityLel.font = TenTypeface;
        activityLel.textColor = ThemeColor;
        activityLel.textAlignment = NSTextAlignmentCenter;
        activityLel.backgroundColor = [UIColor colorWithRed:253 / 255.0 green:238 / 255.0 blue:236 / 255.0 alpha:1];
        activityLel.layer.masksToBounds = YES;
        activityLel.layer.cornerRadius = 3;
        [self addSubview:activityLel];
        // 计算保存下一个x值
        strX = strX + activityLel.width + 5;
        // 判断当前活动是否超出展示区域
        if (strX+activityLel.width > self.width) {
            // 计算保存下一个y值
            strY = strY + strH + 5;
            // x值置0
            strX = 0;
        }
        // self高度
        self.height = strY + strH;
    }
    // 是否对外销售
    if (self.isForeign) {
        // 计算对外销售宽高
        CGSize foreignSiz = [self computeCharacterize:@"可对外销售" font:TenTypeface swellSize:CGSizeMake(8, 4)];
        // 判断当前活动是否超出展示区域
        if (strX+foreignSiz.width > self.width) {
            // 计算保存下一个y值
            strY = strY + strH + 5;
            // x值置0
            strX = 0;
        }
        // 创建控件
        UILabel *foreignLel = [[UILabel alloc] init];
        foreignLel.x = strX;
        foreignLel.y = strY;
        foreignLel.size = foreignSiz;
        foreignLel.text = @"可对外销售";
        foreignLel.font = TenTypeface;
        foreignLel.textColor = ThemeColor;
        foreignLel.textAlignment = NSTextAlignmentCenter;
        foreignLel.backgroundColor = [UIColor colorWithRed:229 / 255.0 green:175 / 255.0 blue:246 / 255.0 alpha:1];
        foreignLel.layer.masksToBounds = YES;
        foreignLel.layer.cornerRadius = 3;
        [self addSubview:foreignLel];
        // self高度
        self.height = strY + strH;
    }
    

}

#pragma makr - 创建控件
- (void)activityLayoutView {
    
}



#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
}

#pragma mark - 计算字符size
- (CGSize)computeCharacterize:(NSString *)text font:(UIFont *)font swellSize:(CGSize)swellSize {
    if (text && text.length != 0) {
        // 计算字符size
        CGSize size = [text sizeWithAttributes:@{NSFontAttributeName: font}];
        NSAttributedString *attributeSting = [[NSAttributedString alloc] initWithString:text attributes:@{NSFontAttributeName: font}];
        size = [attributeSting size];
        size = CGSizeMake(size.width + swellSize.width, size.height + swellSize.height);
        return size;
    }
    return swellSize;
}

@end
