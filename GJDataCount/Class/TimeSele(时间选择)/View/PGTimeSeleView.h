//
//  PGTimeSeleView.h
//  GJDataCount
//
//  Created by apple on 2017/12/16.
//  Copyright © 2017年 apple. All rights reserved.
//  预约时间范围选择

#import <UIKit/UIKit.h>

@interface PGTimeSeleView : UIView

/** 确定选择 */
@property (copy, nonatomic) void(^confirmBlock)(NSString *contentStr);
/** 动画显示 */
- (void)showAnimate;

@end
