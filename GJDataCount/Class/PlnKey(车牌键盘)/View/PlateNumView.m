//
//  PlateNumView.m
//  GJDataCount
//
//  Created by apple on 2017/12/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PlateNumView.h"

@implementation PlateNumView

+ (PlateNumView *)loadBlueViewFromXIB {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"PlateNumView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

@end
