//
//  PGQuickScreenView.h
//  GJDataCount
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGQuickTermView.h"

@interface PGQuickScreenView : UIView

/** 快捷筛选条件view（横向） */
@property (strong, nonatomic) UIStackView *horQuickVie;
/** 快捷筛选条件view（纵向） */
@property (strong, nonatomic) UIStackView *verQuickVie;
/** 快捷筛选条件 */
@property (strong, nonatomic) NSMutableArray *quickScreenAry;

@end
