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
    
}

#pragma mark - 界面赋值
- (void)pieChartAssignment {
    self.pieChartView.datas = @[@(arc4random()%100), @(arc4random()%100), @(arc4random()%100)];
}


#pragma mark - 布局视图
- (void)pieChartLayoutView {
    /** 饼状图view */
    self.pieChartView = [[PieChartView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.pieChartView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
