//
//  PGAddBookViewController.m
//  GJDataCount
//
//  Created by apple on 2018/1/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PGAddBookViewController.h"
#import "PGAddBookView.h"
#import "PGDivisionModel.h"
#import "PGStaffModel.h"

@interface PGAddBookViewController ()

/** 拨打电话view */
@property (strong, nonatomic) PGAddBookView *addBookView;

@end

@implementation PGAddBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 布局视图
    [self addBookLayoutView];
    // 布局nav
    [self addBookLayoutNAV];
    // 网络请求
    [self addBookRequestData];
    
    
    
}

#pragma mark - 网络请求
- (void)addBookRequestData {
//    /** 部门ary */
//    self.addBookView.divisionAry = @[@"特别的人", @"车位运营部", @"业务处理中心", @"领城公园", @"技术部", @"行政部", @"财务部", @"联合推广部"].mutableCopy;
//    /** 人员ary */
//    self.addBookView.staffAry = @[@"企", @"技", @"人", @"组"].mutableCopy;
    
//    PGDivisionModel *division = [[PGDivisionModel alloc] init];
//    [division createDatabaseTables];
//
//    for (NSString *name in self.addBookView.divisionAry) {
//        PGDivisionModel *division = [[PGDivisionModel alloc] init];
//        division.database = name;
//        division.databaseID = arc4random() % 10 + 3;
//        [division addData:division];
//
//    }
    PGDivisionModel *division = [[PGDivisionModel alloc] init];
    self.addBookView.divisionAry =[division queryData];
    
    
   
    
//    for (int i = 0; i < 10; i++) {
//        PGStaffModel *staffModel = [[PGStaffModel alloc] init];
//        /** 名字 */
//        staffModel.name = [NSString stringWithFormat:@"%@%d", @"弓杰", i];
//        /** 电话 */
//        staffModel.phone = [NSString stringWithFormat:@"%ld", arc4random() % 10000000000];
//        /** 头像 */
//        staffModel.headImg = @"http://";
//        /** 是否关注（0：未关注，1：已经关注） */
//        staffModel.isFollow = arc4random() % 2;
//        /** 部门ID */
//        staffModel.databaseID = arc4random() % 7;
//        /** 部门 */
//        staffModel.database = @"技术部";
//        [staffModel addData:staffModel];
//    }
    PGDivisionModel *divisionModel = [self.addBookView.divisionAry firstObject];
    PGStaffModel *staffModel = [[PGStaffModel alloc] init];
    self.addBookView.staffAry = [staffModel queryData:divisionModel.databaseID];
    
    
}

#pragma mark - 功能选择按钮
- (void)addBookBtnAvtion:(UIButton *)button {
    
}


//#pragma mark - 网络请求失败
//- (void)reloadBtnAction:(UIButton *)button {
//    [super reloadBtnAction:button];
//}

#pragma mark - 界面赋值
- (void)addBookAssignment {
    
}


#pragma mark - 布局nav
- (void)addBookLayoutNAV {
    self.navigationItem.title = @"通讯录";
    // 右边
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector()];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_add"] style:UIBarButtonItemStyleDone target:self action:@selector()];
}

#pragma mark - 布局视图
- (void)addBookLayoutView {
    self.view.backgroundColor = [UIColor whiteColor];
    /** 拨打电话view */
    self.addBookView = [[PGAddBookView alloc] init];
    [self.view addSubview:self.addBookView];
    @weakify(self)
    [self.addBookView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
