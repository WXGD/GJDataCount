//
//  PGStagingViewController.m
//  GJDataCount
//
//  Created by apple on 2017/12/26.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PGStagingViewController.h"
// view
#import "PGStagingView.h"

@interface PGStagingViewController ()

/** 分期view */
@property (strong, nonatomic) PGStagingView *stagingVie;

@end

@implementation PGStagingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 布局视图
    [self stagingLayoutView];
    // 布局nav
    [self stagingLayoutNAV];
    // 网络请求
    [self stagingRequestData];
}

#pragma mark - 网络请求
- (void)stagingRequestData {
    
}

#pragma mark - 功能选择按钮
- (void)stagingBtnAvtion:(UIButton *)button {
    
}

#pragma mark - 界面赋值
- (void)stagingAssignment {
    
}

#pragma mark - 布局nav
- (void)stagingLayoutNAV {
    self.navigationItem.title = @"分期";
    // 右边
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector()];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector()];
}

#pragma mark - 布局视图
- (void)stagingLayoutView {
    /** 分期view */
    self.stagingVie = [[PGStagingView alloc] init];
    [self.view addSubview:self.stagingVie];
    @weakify(self)
    [self.stagingVie mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.view.mas_top).offset(88);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
