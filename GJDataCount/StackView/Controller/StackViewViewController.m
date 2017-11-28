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

@interface StackViewViewController ()

@property (strong, nonatomic) PGQuickScreenView *quickScreenView;

@end

@implementation StackViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RANDOMCOLOR;
    // 布局视图
    [self stackLayoutView];
}
- (void)btnAction:(UIButton *)button {
//    PGQuickTermView *termBtn = [[PGQuickTermView alloc] init];
//    [self.quickScreenView.verQuickVie addArrangedSubview:termBtn];
}


#pragma mark - 布局视图
- (void)stackLayoutView {
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
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = RANDOMCOLOR;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 30);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
