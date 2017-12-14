//
//  PGActivityView.h
//  GJDataCount
//
//  Created by apple on 2017/12/1.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGActivityView : UIView

/** 是否分期 */
@property (assign, nonatomic) BOOL isStagesBol;
/** 是否对外销售 */
@property (assign, nonatomic) BOOL isForeign;
/** 活动ary */
@property (strong, nonatomic) NSArray *activityAry;


@end
