//
//  PlnKeyViewController.m
//  GJDataCount
//
//  Created by apple on 2017/12/21.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PlnKeyViewController.h"
#import "PlateNumView.h"

@interface PlnKeyViewController ()

@property (strong, nonatomic) PlateNumView *plateNum;

@end

@implementation PlnKeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WhiteColor;
    
    
    self.plateNum = [[PlateNumView alloc] init];
    self.plateNum.backgroundColor = ThemeColor;
    [self.view addSubview:self.plateNum];
    [self.plateNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(200);
        make.left.equalTo(self.view.mas_left).offset(50);
        make.right.equalTo(self.view.mas_right).offset(-50);
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
