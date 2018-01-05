//
//  PieChartView.m
//  GJDataCount
//
//  Created by apple on 2017/11/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PieChartView.h"

@interface PieChartView ()

/** 背景Layer，为了饼图滚动出现的动画 */
@property (nonatomic, strong) CAShapeLayer *backAnimLay;
/** 背景Layer，为了饼图滚动出现的动画 */
@property (nonatomic, assign) CGPoint contetPoint;
/** 中心圆 */
@property (nonatomic, strong) CAShapeLayer *contentLay;

@end


@implementation PieChartView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.radiusDou = self.height / 4;
        self.contetPoint = CGPointMake(self.center.x - self.x, self.center.y - self.y);
        
        [self pieChartLayoutView];
        
        
    }
    return self;
}


#pragma makr - set方法
- (void)setDatas:(NSArray <NSNumber *>*)datas {

    CGFloat start = -M_PI_2;
    CGFloat end = start;
    while (datas.count > self.layer.sublayers.count) {
        
        CAShapeLayer *backAnimLay = [CAShapeLayer layer];
        backAnimLay.strokeColor = NULL;
        [self.layer addSublayer:backAnimLay];
    }
    

    
    
    
    for (int i = 0; i < self.layer.sublayers.count; i ++) {
        
        
        // 折线属性
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.strokeColor = WhiteColor.CGColor;
        layer.fillColor = CLEARCOLOR.CGColor;
        layer.lineWidth = 2;
        
        CAShapeLayer *backAnimLay = (CAShapeLayer *)self.layer.sublayers[i];
        if (i < datas.count) {
            backAnimLay.hidden = NO;
            end =  start + M_PI*2*[datas[i] floatValue];
            
            UIBezierPath *piePath = [UIBezierPath bezierPath];
            [piePath moveToPoint:self.contetPoint];
            [piePath addArcWithCenter:self.contetPoint radius:self.radiusDou*2-10 startAngle:start endAngle:end clockwise:YES];
            backAnimLay.fillColor = RANDOMCOLOR.CGColor;
            

            backAnimLay.strokeStart = start;
            backAnimLay.strokeEnd = end;
            
            backAnimLay.path = piePath.CGPath;
            
            // 绘制折线
            UIBezierPath *path = [[UIBezierPath alloc]init];
            // 折线图起点 brokenOrigin
            // 折线起点
            [path moveToPoint:self.contetPoint];
            [self.layer addSublayer:layer];

            //原始中心点为（0，0），扇形所在圆心、原始中心点、偏移点三者是在一条直线，通过三角函数即可得到偏移点的对应x，y。
            double middleAngle = backAnimLay.strokeStart;
            CGPoint newPos = CGPointMake(self.contetPoint.x + (self.radiusDou*2-10)*cos(middleAngle), self.contetPoint.y + (self.radiusDou*2-10)*sin(middleAngle));

            [path addLineToPoint:newPos];

            layer.path = path.CGPath;
            
            start = end;
            
        }

    }
    
    /** 中心圆 */
    // 画一个圆, 用来空心(如果满圆则可以不要这块)
    UIBezierPath *radiusPath = [UIBezierPath bezierPathWithArcCenter:self.contetPoint radius:20 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [radiusPath addLineToPoint:self.center];
    [radiusPath closePath];
    self.contentLay = [CAShapeLayer layer];
    self.contentLay.lineWidth = 40;
    self.contentLay.fillColor = WhiteColor.CGColor;
    self.contentLay.path = radiusPath.CGPath;
    [self.layer addSublayer:self.contentLay];
}




#pragma makr - 创建控件
- (void)pieChartLayoutView {
    //通过mask来控制显示区域
    self.backAnimLay = [CAShapeLayer layer];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.center.x - self.x, self.center.y - self.y) radius:self.radiusDou startAngle:-M_PI_2 endAngle:M_PI_2*3 clockwise:YES];
    self.backAnimLay.strokeColor = [UIColor redColor].CGColor;
    self.backAnimLay.lineWidth = self.radiusDou * 2;
    self.backAnimLay.fillColor = [UIColor clearColor].CGColor;
    self.backAnimLay.path = maskPath.CGPath;
    self.backAnimLay.strokeEnd = 0;
    self.layer.mask = self.backAnimLay;
}


- (void)stroke {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 1.f;
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue = [NSNumber numberWithFloat:1.f];
    // 禁止还原
    animation.autoreverses = NO;
    // 禁止完成即移除
    animation.removedOnCompletion = NO;
    // 让动画保持在最后状态
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.backAnimLay addAnimation:animation forKey:@"strokeEnd"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [touches.anyObject locationInView:self];
    [self upDateLayersWithPoint:point];
}

- (void)upDateLayersWithPoint:(CGPoint)point{
    //如需做点击效果，则应采用第二种方法较好
    for (CAShapeLayer *layer in self.layer.sublayers) {
        if (CGPathContainsPoint(layer.path, &CGAffineTransformIdentity, point, 0)) {
            //原始中心点为（0，0），扇形所在圆心、原始中心点、偏移点三者是在一条直线，通过三角函数即可得到偏移点的对应x，y。
            CGPoint currPos = layer.position;
            double middleAngle = (layer.strokeStart + layer.strokeEnd)/2.0;
            CGPoint newPos = CGPointMake(currPos.x + 10*cos(middleAngle), currPos.y + 10*sin(middleAngle));
            layer.position = newPos;
        }else{
            layer.position = CGPointMake(0, 0);
        }
    }
}



#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
}


@end
