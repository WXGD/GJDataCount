//
//  TableCellViewController.m
//  GJDataCount
//
//  Created by apple on 2018/1/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TableCellViewController.h"
#import "PGTableViewCell.h"

@interface TableCellViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation TableCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 布局视图
    [self LayoutView];
    // 布局nav
    [self LayoutNAV];
    // 网络请求
    [self RequestData];
}

#pragma mark - 网络请求
- (void)RequestData {
    
}





#pragma mark - 界面赋值
- (void)rightBarItemClick:(UIBarButtonItem *)item {

    [self.tableView setEditing:YES animated:YES];

}


#pragma mark - 布局nav
- (void)LayoutNAV {
    // 右边
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarItemClick:)];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector()];
}

#pragma mark - 布局视图
- (void)LayoutView {
    /** table */
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    @weakify(self)
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    // tableview高度随数据高度变化而变化
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}


#pragma mark - tableviewDegate、DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"DangerRecordCell";
    PGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        
        cell = [[PGTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    

    if (tableView.isEditing)
    {
        return;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
