//
//  PhotoBrowserViewController.m
//  GJDataCount
//
//  Created by apple on 2017/12/11.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "PhotoBrowserViewController.h"
#import "MWPhotoBrowser.h"
#import "MBProgressHUD.h"

@interface PhotoBrowserViewController ()<MWPhotoBrowserDelegate>

@property (strong, nonatomic) NSArray *srcStringArray;
@property (strong, nonatomic) NSMutableArray *photos;

@end

@implementation PhotoBrowserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 布局视图
    [self LayoutView];
    
    self.view.backgroundColor = WhiteColor;
    
    _srcStringArray = @[
                        @"http://ww2.sinaimg.cn/thumbnail/9ecab84ejw1emgd5nd6eaj20c80c8q4a.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/642beb18gw1ep3629gfm0g206o050b2a.gif",
                        @"http://ww4.sinaimg.cn/thumbnail/9e9cb0c9jw1ep7nlyu8waj20c80kptae.jpg",
                        @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr1xydcj20gy0o9q6s.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr2n1jjj20gy0o9tcc.jpg",
                        @"http://ww4.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr4nndfj20gy0o9q6i.jpg",
                        @"http://ww3.sinaimg.cn/thumbnail/8e88b0c1gw1e9lpr57tn9j20gy0obn0f.jpg",
                        @"http://ww2.sinaimg.cn/thumbnail/677febf5gw1erma104rhyj20k03dz16y.jpg",
                        ];
}


#pragma mark - 功能选择按钮
- (void)btnAction:(UIButton *)button {
    NSMutableArray *photos = [[NSMutableArray alloc] init];
    
    for (NSString *url in _srcStringArray)
    {
        MWPhoto* photo = [MWPhoto photoWithURL:[NSURL URLWithString:url]]; // 设置图片地址
        //        photo.caption = description; // 设置描述
        [photos addObject:photo];
    }
    
    _photos = photos;
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    
    browser.displayActionButton = YES;
//         browser.zoomPhotosToFill =NO;//是否全屏,默认是
         browser.alwaysShowControls =YES;//控制条件控件是否显示,默认否
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:browser];
    nc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nc animated:YES completion:nil];

}




#pragma mark - 布局视图
- (void)LayoutView {

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.normalTitle = @"点我";
    btn.backgroundColor = RANDOMCOLOR;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 30);
    
    
    
}

#pragma mark - MWPhotoBrowserDelegate
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
{
    return _photos.count;
}

- (MWPhoto *)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
{
    if (index < _photos.count)
        return [_photos objectAtIndex:index];
    
    return nil;
}

//当点击右下角的分享按钮的时候触下面的方法

- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser actionButtonPressedForPhotoAtIndex:(NSUInteger)index {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"点击you下角分享按钮的时候出发，这里可以做自己的事情");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
