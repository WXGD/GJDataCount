//
//  StackViewViewController.m
//  GJDataCount
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "StackViewViewController.h"
#import "PGQuickScreenView.h"
#import "PGQuickTermView.h"
#import "PGActivityView.h"

@interface StackViewViewController ()

@property (strong, nonatomic) PGQuickScreenView *quickScreenView;

@property (strong, nonatomic) PGActivityView *activityView;

@end

@implementation StackViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RANDOMCOLOR;
    // 布局视图
    [self stackLayoutView];
}
- (void)btnAction:(UIButton *)button {
    PGQuickTermView *termBtn = [[PGQuickTermView alloc] init];
    [self.quickScreenView.verQuickVie addArrangedSubview:termBtn];
}


#pragma mark - 布局视图
- (void)stackLayoutView {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.normalTitle = @"点我";
    btn.backgroundColor = RANDOMCOLOR;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 30);
    
    
    
    self.quickScreenView = [[PGQuickScreenView alloc] init];
    self.quickScreenView.quickScreenAry = @[@"a", @"a", @"a", @"a"].mutableCopy;

    [self.view addSubview:self.quickScreenView];
    @weakify(self)
    [self.quickScreenView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.view.mas_top).offset(200);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
//        make.bottom.equalTo(self.view.mas_bottom);
    }];
//

    
    self.activityView = [[PGActivityView alloc] init];
    [self.view addSubview:self.activityView];
    self.activityView.frame = CGRectMake(0, 500, 300, 30);

    
    [self.activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.quickScreenView.mas_bottom).offset(50);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
//        make.height.mas_equalTo(@50);
//        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
   
        /** 是否分期 */
        self.activityView.isStagesBol = YES;
        /** 是否对外销售 */
        self.activityView.isForeign = YES;
        /** 活动ary */
        self.activityView.activityAry = @[@"交2000抵2500", @"交2000抵2500", @"交2000抵2500", @"交2000抵2500", @"交2000抵2500", @"交2000抵2500", @"交2000抵2500", @"交2000抵2500"];
    
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
