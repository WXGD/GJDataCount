//
//  PGBrowsingViewController.m
//  GJDataCount
//
//  Created by apple on 2018/1/5.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PGBrowsingViewController.h"
#import "MSSBrowseDefine.h"

@interface PGBrowsingViewController ()

@end

@implementation PGBrowsingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WhiteColor;
    
    UIButton *netbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    netbtn.normalTitle = @"网络图片";
    netbtn.backgroundColor = RANDOMCOLOR;
    [netbtn addTarget:self action:@selector(netbtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:netbtn];
    netbtn.frame = CGRectMake(100, 100, 100, 30);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.normalTitle = @"本地图片";
    btn.backgroundColor = RANDOMCOLOR;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(300, 100, 100, 30);
}


- (void)netbtnAction:(UIButton *)button {
    NSArray *bigUrlArray = @[@"http://7xjtvh.com1.z0.glb.clouddn.com/browse01.jpg",
                             @"http://7xjtvh.com1.z0.glb.clouddn.com/browse02.jpg",
                             @"http://7xjtvh.com1.z0.glb.clouddn.com/browse03.jpg",
                             @"http://7xjtvh.com1.z0.glb.clouddn.com/browse04.jpg",
                             @"http://7xjtvh.com1.z0.glb.clouddn.com/browse05.jpg",
                             @"http://7xjtvh.com1.z0.glb.clouddn.com/browse06.jpg",
                             @"http://7xjtvh.com1.z0.glb.clouddn.com/browse07.jpg",
                             @"http://7xjtvh.com1.z0.glb.clouddn.com/browse08.jpg",
                             @"http://7xjtvh.com1.z0.glb.clouddn.com/browse09.jpg"];
    // 加载网络图片
    NSMutableArray *browseItemArray = [[NSMutableArray alloc]init];
    for (NSString *img in bigUrlArray) {
        MSSBrowseModel *browseItem = [[MSSBrowseModel alloc]init];
        browseItem.bigImageUrl = img;// 加载网络图片大图地址
        [browseItemArray addObject:browseItem];
    }
    MSSBrowseNetworkViewController *bvc = [[MSSBrowseNetworkViewController alloc]initWithBrowseItemArray:browseItemArray currentIndex:0];
    bvc.isEqualRatio = NO;// 大图小图不等比时需要设置这个属性（建议等比）
    [bvc showBrowseViewController];
}

- (void)btnAction:(UIButton *)button {
    NSArray *bigUrlArray = @[@"btn_verbg_nor",
                             @"order",
                             @"key_click",
                             @"key_del_click",
                             @"key_del_nor",
                             @"key_nor"];
    // 加载本地图片
    NSMutableArray *browseItemArray = [[NSMutableArray alloc]init];
    for (NSString *img in bigUrlArray) {
        MSSBrowseModel *browseItem = [[MSSBrowseModel alloc]init];
        browseItem.bigImage = [UIImage imageNamed:img];
        [browseItemArray addObject:browseItem];
    }
    MSSBrowseLocalViewController *bvc = [[MSSBrowseLocalViewController alloc]initWithBrowseItemArray:browseItemArray currentIndex:0];
    [bvc showBrowseViewController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
