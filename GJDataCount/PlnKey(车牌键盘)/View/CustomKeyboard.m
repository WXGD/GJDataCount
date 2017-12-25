//
//  CustomKeyboard.m
//  GJDataCount
//
//  Created by apple on 2017/12/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


#import "CustomKeyboard.h"

@interface CustomKeyboard ()

/** 1 */
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
/** 2 */
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
/** 3 */
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
/** 4 */
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;
/** 5 */
@property (weak, nonatomic) IBOutlet UIButton *fiveBtn;
/** 6 */
@property (weak, nonatomic) IBOutlet UIButton *sixBtn;
/** 7 */
@property (weak, nonatomic) IBOutlet UIButton *sevenBtn;
/** 8 */
@property (weak, nonatomic) IBOutlet UIButton *eightBtn;
/** 9 */
@property (weak, nonatomic) IBOutlet UIButton *nineBtn;
/** 0 */
@property (weak, nonatomic) IBOutlet UIButton *zeroBtn;
/** 香港 */
@property (weak, nonatomic) IBOutlet UIButton *hongkongBtn;
/** 澳门 */
@property (weak, nonatomic) IBOutlet UIButton *macaoBtn;

@end

@implementation CustomKeyboard

+ (CustomKeyboard *)loadBlueViewFromXIB {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"CustomKeyboard" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}



#pragma mark - 选中输入
- (IBAction)selectInput:(UIButton *)sender {
    
}


- (IBAction)delete:(UIButton *)sender {
    
}



- (void)aaa:(BOOL)bol {
    /** 1 */
    self.oneBtn.selected = bol;
    /** 2 */
    self.twoBtn.selected = bol;
    /** 3 */
    self.threeBtn.selected = bol;
    /** 4 */
    self.fourBtn.selected = bol;
    /** 5 */
    self.fiveBtn.selected = bol;
    /** 6 */
    self.sixBtn.selected = bol;
    /** 7 */
    self.sevenBtn.selected = bol;
    /** 8 */
    self.eightBtn.selected = bol;
    /** 9 */
    self.nineBtn.selected = bol;
    /** 0 */
    self.zeroBtn.selected = bol;
    /** 香港 */
    self.hongkongBtn.selected = bol;
    /** 澳门 */
    self.macaoBtn.selected = bol;
}



- (void)layoutSubviews {
    [super layoutSubviews];
}

@end
