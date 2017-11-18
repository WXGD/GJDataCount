//
//  BrokenLineViewController.m
//  GJDataCount
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "BrokenLineViewController.h"
#import "BrokenLineBackView.h"

@interface BrokenLineViewController ()

@property (strong, nonatomic) BrokenLineBackView *brokenLineBackView;

@end

@implementation BrokenLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = GrayVCColor;
    // 布局视图
    [self lineLayoutView];
}


#pragma mark - 布局nav
- (void)btnAction:(UIButton *)button {
    
}

#pragma mark - 布局视图
- (void)lineLayoutView {
    self.lineView = [[BrokenLineBackView alloc] init];
    [self.view addSubview:self.lineView];
    @weakify(self)
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.centerY.equalTo(self.view.mas_centerY);
        make.centerX.equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
