//
//  TableViewController.m
//  GJDataCount
//
//  Created by apple on 2017/11/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "TableViewController.h"
#import "BrokenLineViewController.h"
#import "StackViewViewController.h"
#import "PieChartViewController.h"
#import "PhotoBrowserViewController.h"
#import "PGTimeSeleViewController.h"
#import "PlnKeyViewController.h"
#import "PGStagingViewController.h"
#import "DialingViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0: {
            cell.textLabel.text = @"折线图";
            break;
        }
        case 1: {
            cell.textLabel.text = @"饼状图";
            break;
        }
        case 2: {
            cell.textLabel.text = @"StackView使用";
            break;
        }
        case 3: {
            cell.textLabel.text = @"图片浏览";
            break;
        }
        case 4: {
            cell.textLabel.text = @"时间选择";
            break;
        }
        case 5: {
            cell.textLabel.text = @"车牌键盘";
            break;
        }
        case 6: {
            cell.textLabel.text = @"分期";
            break;
        }
        case 7: {
            cell.textLabel.text = @"拨打电话";
            break;
        }
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            BrokenLineViewController *brokenLineVC = [[BrokenLineViewController alloc] init];
            [self.navigationController pushViewController:brokenLineVC animated:YES];
            break;
        }
        case 1: {
            PieChartViewController *pieChartVC = [[PieChartViewController alloc] init];
            [self.navigationController pushViewController:pieChartVC animated:YES];
            break;
        }
        case 2: {
            StackViewViewController *stackViewVC = [[StackViewViewController alloc] init];
            [self.navigationController pushViewController:stackViewVC animated:YES];
            break;
        }
        case 3: {
            PhotoBrowserViewController *photoBrowserVC = [[PhotoBrowserViewController alloc] init];
            [self.navigationController pushViewController:photoBrowserVC animated:YES];
            break;
        }
        case 4: {
            PGTimeSeleViewController *timeSeleVC = [[PGTimeSeleViewController alloc] init];
            [self.navigationController pushViewController:timeSeleVC animated:YES];
            break;
        }
        case 5: {
            PlnKeyViewController *plnKeyVC = [[PlnKeyViewController alloc] init];
            [self.navigationController pushViewController:plnKeyVC animated:YES];
            break;
        }
        case 6: {
            PGStagingViewController *stagingVC = [[PGStagingViewController alloc] init];
            [self.navigationController pushViewController:stagingVC animated:YES];
            break;
        }
        case 7: {
            DialingViewController *stagingVC = [[DialingViewController alloc] init];
            [self.navigationController pushViewController:stagingVC animated:YES];
            break;
        }
            default:
            break;
    }
}



@end
