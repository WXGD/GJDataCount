//
//  PGTimeSeleViewController.m
//  GJDataCount
//
//  Created by apple on 2017/12/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PGTimeSeleViewController.h"
#import "PGTimeSeleView.h"

@interface PGTimeSeleViewController ()

@end

@implementation PGTimeSeleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WhiteColor;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.normalTitle = @"点我";
    btn.backgroundColor = RANDOMCOLOR;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 30);
}


- (void)btnAction:(UIButton *)button {
    PGTimeSeleView *seleObjectView = [[PGTimeSeleView alloc] init];
    seleObjectView.confirmBlock = ^(NSString *contentStr) {
        
        NSLog(@"%@", contentStr);
        
        
    };
    [seleObjectView showAnimate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




@end
