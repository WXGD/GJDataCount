//
//  PieChartView.m
//  GJDataCount
//
//  Created by apple on 2017/11/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PieChartView.h"

@interface PieChartView ()

@property (nonatomic,assign)CGFloat startAngle; //开始角度
@property (nonatomic,assign)CGFloat endAngle;   //结束角度
@property (nonatomic,assign)BOOL    isSelected; //是否已经选中

//路径，根据这个路径来绘制形状
@property(nullable) CGPathRef path;
//路径所包含区域的填充色
@property(nullable) CGColorRef fillColor;
//绘制路径的颜色
@property(nullable) CGColorRef strokeColor;
//路径绘制的开始值，默认为0，可以更改这个值来控制路径绘制的起始位置
@property CGFloat strokeStart;
//路径绘制的结束值，默认为1，可以更改这个值来控制路径绘制的结束位置
@property CGFloat strokeEnd;
//线宽
@property CGFloat lineWidth;

@end


@implementation PieChartView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = WhiteColor;
        [self pieChartLayoutView];
    }
    return self;
}

#pragma makr - set方法
- (void)setDatas:(NSArray <NSNumber *>*)datas {
    NSArray *newDatas = [self getPersentArraysWithDataArray:datas];
    CGFloat start = -M_PI_2;
    CGFloat end = start;

    for (int i = 0; i < newDatas.count; i ++) {
        UIBezierPath *piePath = [UIBezierPath bezierPathWithArcCenter:self.center radius:40 startAngle:-M_PI_2 endAngle:M_PI_2*3 clockwise:YES];

        NSNumber *number = newDatas[i];
        end =  start + number.floatValue;
        CAShapeLayer *pieLayer = [CAShapeLayer layer];
        pieLayer.strokeStart = start;
        pieLayer.strokeEnd = end;
        pieLayer.lineWidth = 80;
        pieLayer.strokeColor = RANDOMCOLOR.CGColor;
        pieLayer.fillColor = CLEARCOLOR.CGColor;
        pieLayer.path = piePath.CGPath;

        [self.layer addSublayer:pieLayer];
        start = end;
    }
    
}


/**
 将数据按降序排列，再计算出所占比例返回
 
 @param datas 原始数据
 @return 数据占比数组
 */
- (NSArray *)getPersentArraysWithDataArray:(NSArray *)datas{
    NSArray *newDatas = [datas sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        if ([obj1 floatValue] < [obj2 floatValue]) {
            return NSOrderedDescending;
        }else if ([obj1 floatValue] > [obj2 floatValue]){
            return NSOrderedAscending;
        }else{
            return NSOrderedSame;
        }
    }];
    
    NSMutableArray *persentArray = [NSMutableArray array];
    NSNumber *sum = [newDatas valueForKeyPath:@"@sum.floatValue"];
    for (NSNumber *number in newDatas) {
        [persentArray addObject:@(number.floatValue/sum.floatValue)];
    }
    
    return persentArray;
}


#pragma makr - 创建控件
- (void)pieChartLayoutView {
//    // 画一个圆, 用来空心(如果满圆则可以不要这块)
//    UIBezierPath *radiusPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:100 startAngle:0 endAngle:2*M_PI clockwise:YES];
//    [radiusPath addLineToPoint:self.center];
//    [radiusPath closePath];
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    shapeLayer.lineWidth = 1;
//    shapeLayer.fillColor = RANDOMCOLOR.CGColor;
//    shapeLayer.path = radiusPath.CGPath;
//    [self.layer addSublayer:shapeLayer];
}



#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
}


@end
