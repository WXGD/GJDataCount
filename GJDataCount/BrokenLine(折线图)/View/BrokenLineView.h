//
//  BrokenLineView.h
//  GJDataCount
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 apple. All rights reserved.
//
/** 随机色 */
#define RANDOMCOLOR [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1]
/** 清除背景色 */
#define CLEARCOLOR [UIColor clearColor]
/** 文字灰色(66,66,66) */
#define GrayH6Color [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]
/** 文字灰色(99,99,99) */
#define GrayH9Color [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1]
/** 分割线颜色(DD,DD,DD) */
#define GrayLineColor [UIColor colorWithRed:221 / 254.0 green:221 / 254.0 blue:221 / 254.0 alpha:1]
/** 控制器背景颜色(EE,EE,EE) */
#define GrayVCColor [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1]
/** 主题色(00,CA,A3) */
#define ThemeColor [UIColor colorWithRed:0/255.0 green:202/255.0 blue:163/255.0 alpha:1]
/** 白色(FF,FF,FF) */
#define WhiteColor [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]
/** 黄色(FC,BF,13) */
#define YellowColor [UIColor colorWithRed:252/255.0 green:191/255.0 blue:19/255.0 alpha:1]
/** 红色(EA,55,44) */
#define RedColor [UIColor colorWithRed:234/255.0 green:85/255.0 blue:68/255.0 alpha:1]
/** 蓝色(1E,88,E5) */
#define BlueColor [UIColor colorWithRed:30/255.0 green:136/255.0 blue:229/255.0 alpha:1]



#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "ReactiveObjC.h"
#import "UIView+Extension.h"

@interface BrokenLineView : UIView


/****************控件****************/
/** 选中分割线属性 */
@property (strong, nonatomic) UIView *seleDashView;
/****************属性参数****************/
/** 是否有Y轴(YES:有，NO:没有，默认YES) */
@property (assign, nonatomic) BOOL isYAxis;
/** 是否有X轴(YES:有，NO:没有，默认YES) */
@property (assign, nonatomic) BOOL isXAxis;
/****************数据参数****************/
/** 折线数组(里面是数组，一个数组就是一条线，每个数组中，包含的是每一个点) */
@property (strong, nonatomic) NSArray *brokenLineAry;
/** 折线颜色数组(里面是UIColor类型，每一条线的颜色) */
@property (strong, nonatomic) NSArray *brokenLineColorAry;

#pragma makr - 初始化方法
+ (instancetype)foundBrokenLineChartXNodeAry:(NSArray *)xNodeAry yNodeAry:(NSArray *)yNodeAry xOrigin:(CGFloat)xOrigin yOrigin:(CGFloat)yOrigin xAxisSpac:(CGFloat)xAxisSpac yAxisSpac:(CGFloat)yAxisSpac xAxisRightSpac:(CGFloat)xAxisRightSpac yAxisTopSpac:(CGFloat)yAxisTopSpac;

@end
