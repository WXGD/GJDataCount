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


@property (nonatomic, strong) CAShapeLayer *pieLayer;


@end


@implementation PieChartView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = WhiteColor;
        [self pieChartLayoutView];
        
        
        
        //通过mask来控制显示区域
        self.pieLayer = [CAShapeLayer layer];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:40 startAngle:-M_PI_2 endAngle:M_PI_2*3 clockwise:YES];
        //设置边框颜色为不透明，则可以通过边框的绘制来显示整个view
        self.pieLayer.strokeColor = [UIColor greenColor].CGColor;
        self.pieLayer.lineWidth = 80;
        //设置填充颜色为透明，可以通过设置半径来设置中心透明范围
        self.pieLayer.fillColor = [UIColor clearColor].CGColor;
        self.pieLayer.path = maskPath.CGPath;
        self.pieLayer.strokeEnd = 0;
        self.layer.mask = self.pieLayer;
    }
    return self;
}

#pragma makr - set方法
- (void)setDatas:(NSArray <NSNumber *>*)datas {
//    NSArray *newDatas = [self getPersentArraysWithDataArray:datas];
//    NSArray *newDatas = datas;
//    CGFloat start = -M_PI_2;
//    CGFloat end = start;
//
//    for (int i = 0; i < newDatas.count; i ++) {
//        UIBezierPath *piePath = [UIBezierPath bezierPathWithArcCenter:self.center radius:40 startAngle:-M_PI_2 endAngle:M_PI_2*3 clockwise:YES];
//
//        NSNumber *number = newDatas[i];
//        end =  start + number.floatValue;
//        CAShapeLayer *pieLayer = [CAShapeLayer layer];
//        pieLayer.strokeStart = start;
//        pieLayer.strokeEnd = end;
//        pieLayer.lineWidth = 80;
//        pieLayer.strokeColor = RANDOMCOLOR.CGColor;
//        pieLayer.fillColor = CLEARCOLOR.CGColor;
//        pieLayer.path = piePath.CGPath;
//
//        [self.layer addSublayer:pieLayer];
//        start = end;
//    }
    
    UIBezierPath *piePath = [UIBezierPath bezierPathWithArcCenter:self.center radius:40 startAngle:-M_PI_2 endAngle:M_PI_2*3 clockwise:YES];
    CGFloat start = -M_PI_2;
    CGFloat end = start;
    while (datas.count > self.layer.sublayers.count) {
        
        CAShapeLayer *pieLayer = [CAShapeLayer layer];
        pieLayer.strokeColor = NULL;
        [self.layer addSublayer:pieLayer];
    }
    
    // 折线属性
    CAShapeLayer * dashLayer = [CAShapeLayer layer];
    dashLayer.strokeColor = WhiteColor.CGColor;
    dashLayer.fillColor = CLEARCOLOR.CGColor;
    dashLayer.lineWidth = 2;

    // 绘制折线
    UIBezierPath *path = [[UIBezierPath alloc]init];
    // 折线图起点 brokenOrigin
    // 折线起点
    [path moveToPoint:self.center];
    [self.layer addSublayer:dashLayer];
    [path addLineToPoint:CGPointMake(self.centerX, self.centerY - 80)];

    dashLayer.path = path.CGPath;
    
    
    
    for (int i = 0; i < self.layer.sublayers.count; i ++) {
        
       
        // 折线属性
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.strokeColor = WhiteColor.CGColor;
        layer.fillColor = CLEARCOLOR.CGColor;
        layer.lineWidth = 2;
        
        
        
        CAShapeLayer *pieLayer = (CAShapeLayer *)self.layer.sublayers[i];
        if (i < datas.count) {
            pieLayer.hidden = NO;
            end =  start + M_PI*2*[datas[i] floatValue];
            
            UIBezierPath *piePath = [UIBezierPath bezierPath];
            [piePath moveToPoint:self.center];
            [piePath addArcWithCenter:self.center radius:80 startAngle:start endAngle:end clockwise:YES];
            
            pieLayer.fillColor = RANDOMCOLOR.CGColor;
            pieLayer.strokeStart = start;
            pieLayer.strokeEnd = end;
            
            
            
            pieLayer.path = piePath.CGPath;
            

            
            
            
            // 绘制折线
            UIBezierPath *path = [[UIBezierPath alloc]init];
            // 折线图起点 brokenOrigin
            // 折线起点
            [path moveToPoint:self.center];
            [self.layer addSublayer:layer];

            double middleAngle = (start + end)/2.0;

            CGPoint newPos = CGPointMake(pieLayer.position.x + cos(middleAngle), pieLayer.position.y + sin(middleAngle));

//            [path addLineToPoint:CGPointMake(self.centerX + 80, self.centerY)];

            [path addLineToPoint:newPos];
            
            layer.path = path.CGPath;


            NSLog(@"start--(%f)", start);
            NSLog(@"end--(%f)", end);

            NSLog(@"x--(%f),y--(%f)\n\n", newPos.x, newPos.y);

            
            start = end;

        }
//        else{
//            pieLayer.hidden = YES;
//        }
    }
    
    NSLog(@"----000(%f)", [self dotproduct:CGPointMake(self.centerX, self.centerY - 80) v2:CGPointMake(self.centerX + 80, self.centerY)]);
    
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


- (void)stroke{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 1.f;
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue = [NSNumber numberWithFloat:1.f];
    //禁止还原
    animation.autoreverses = NO;
    //禁止完成即移除
    animation.removedOnCompletion = NO;
    //让动画保持在最后状态
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.pieLayer addAnimation:animation forKey:@"strokeEnd"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [touches.anyObject locationInView:self];
    
    [self upDateLayersWithPoint:point];
    
    NSLog(@"%@",NSStringFromCGPoint(point));
}

- (void)upDateLayersWithPoint:(CGPoint)point{
    
    //如需做点击效果，则应采用第二种方法较好
    for (CAShapeLayer *layer in self.layer.sublayers) {
        NSLog(@"%@", layer.path);
        if (CGPathContainsPoint(layer.path, &CGAffineTransformIdentity, point, 0)) {
////            layer.isSelected = YES;
//
//            //原始中心点为（0，0），扇形所在圆心、原始中心点、偏移点三者是在一条直线，通过三角函数即可得到偏移点的对应x，y。
//            CGPoint currPos = layer.position;
//            double middleAngle = (layer.startAngle + layer.endAngle)/2.0;
//            CGPoint newPos = CGPointMake(currPos.x + KOffsetRadius*cos(middleAngle), currPos.y + KOffsetRadius*sin(middleAngle));
//            layer.position = newPos;
            layer.position = CGPointMake(10, 10);

        }else{
//
            layer.position = CGPointMake(0, 0);
////            layer.isSelected = NO;
        }
    }
}

- (CGFloat)dotproduct:(CGPoint)v1 v2:(CGPoint)v2 {

    CGFloat dot = (v1.x * v2.x) +(v1.y * v2.y);
    CGFloat b = ABS(sqrt(v2.x * v2.x + v2.y * v2.y));
    CGFloat a = ABS(sqrt(v1.x * v1.x + v1.y * v1.y));
    dot /= (a * b);
    return dot;
}

#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
}


@end
