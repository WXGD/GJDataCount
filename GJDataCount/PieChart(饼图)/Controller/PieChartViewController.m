//
//  PieChartViewController.m
//  GJDataCount
//
//  Created by apple on 2017/11/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PieChartViewController.h"
#import "PieChartView.h"

@interface PieChartViewController ()

/** 饼状图view */
@property (strong, nonatomic) PieChartView *pieChartView;

@end

@implementation PieChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 布局视图
    [self pieChartLayoutView];
    // 界面赋值
    [self pieChartAssignment];
}

#pragma mark - 功能选择按钮
- (void)pieChartBtnAvtion:(UIButton *)button {
//    self.pieChartView.datas = @[@((arc4random()%90 + 10) / 100.0), @((arc4random()%90 + 10) / 100.0), @((arc4random()%90 + 10) / 100.0)];
    self.pieChartView.datas = @[@(0.165), @(0.165), @(0.165), @(0.165), @(0.165), @(0.165), @(0.01)];
    [self.pieChartView stroke];

}

#pragma mark - 界面赋值
- (void)pieChartAssignment {

}


#pragma mark - 布局视图
- (void)pieChartLayoutView {
    /** 饼状图view */
    self.pieChartView = [[PieChartView alloc] initWithFrame:CGRectMake(0, 200, 200, 200)];
    self.pieChartView.backgroundColor = RedColor;
    [self.view addSubview:self.pieChartView];
    

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.normalTitle = @"点我";
    btn.backgroundColor = RANDOMCOLOR;
    [btn addTarget:self action:@selector(pieChartBtnAvtion:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 30);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
