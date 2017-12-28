//
//  PGStagingView.h
//  GJDataCount
//
//  Created by apple on 2017/12/26.
//  Copyright © 2017年 apple. All rights reserved.
//  分期页面

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "PGTermView.h"
#import "PieChartView.h"

@interface PGStagingView : UIView

/** 首付 */
@property (strong, nonatomic) CustomCell *downPayVie;
/** 利率 */
@property (strong, nonatomic) UILabel *interestLel;
/** 银行 */
@property (strong, nonatomic) CustomCell *bankVie;
/** 分期期数 */
@property (strong, nonatomic) PGTermView *termVie;
/** 饼图 */
@property (strong, nonatomic) PieChartView *chartVie;

@end
