//
//  PieChartView.h
//  GJDataCount
//
//  Created by apple on 2017/11/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PieChartView : UIView

@property (strong, nonatomic) NSArray <NSNumber *>*datas;
- (void)stroke;

@end
