//
//  DialingViewController.m
//  GJDataCount
//
//  Created by apple on 2018/1/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "DialingViewController.h"
#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCall.h>
#import <CallKit/CallKit.h>
@interface DialingViewController ()<CXProviderDelegate>

@property (nonatomic, strong) CTCallCenter *callCenter;
@property(nonatomic,strong) CXCallObserver *callServer;

@end

@implementation DialingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.normalTitle = @"点我";
    btn.backgroundColor = RANDOMCOLOR;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 30);
    
//    self.callServer = [[CXCallObserver alloc] init];
//    [self.callServer setDelegate:self queue:nil];
    
}



-(void)detectCall
{
    self.callCenter = [[CTCallCenter alloc] init];
    self.callCenter.callEventHandler=^(CTCall* call)
    {
        if (call.callState == CTCallStateDisconnected)
        {
            NSLog(@"-----------------------------挂断");   //挂断
            //            self.viewController.signalStatus=YES;
        }
        else if (call.callState == CTCallStateConnected)
        {
            NSLog(@"-----------------------------连通了"); //联通了
        }

        else if(call.callState == CTCallStateIncoming)
        {
            NSLog(@"Call is incoming??????????1");
            //self.viewController.signalStatus=NO;
        }

        else if (call.callState ==CTCallStateDialing)
        {
            NSLog(@"-----------------------------拨号");  //拨号
        }
        else
        {
            NSLog(@"Nothing is done????????????2");
        }
    };
}

- (void)btnAction:(UIButton *)button {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://10086"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
