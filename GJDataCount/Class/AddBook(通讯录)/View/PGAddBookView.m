//
//  PGAddBookView.m
//  GJDataCount
//
//  Created by apple on 2018/1/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PGAddBookView.h"
#import "PGStaffModel.h"
#import "PGDivisionModel.h"

@interface PGAddBookView ()<UITableViewDelegate, UITableViewDataSource>

/** 部门table */
@property (strong, nonatomic) UITableView *divisionTab;
/** 人员table */
@property (strong, nonatomic) UITableView *staffTab;
/** tab分割线 */
@property (strong, nonatomic) UIView *tabLineVie;

@end

@implementation PGAddBookView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addBookLayoutView];
    }
    return self;
}

#pragma makr - 创建控件
- (void)addBookLayoutView {
    /** 部门table */
    self.divisionTab = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.divisionTab.delegate = self;
    self.divisionTab.dataSource = self;
    self.divisionTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.divisionTab.backgroundColor = CLEARCOLOR;
    [self addSubview:self.divisionTab];
    // tableview高度随数据高度变化而变化
    [self.divisionTab setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    /** tab分割线 */
    self.tabLineVie = [[UIView alloc] init];
    self.tabLineVie.backgroundColor = GrayLineColor;
    [self addSubview:self.tabLineVie];
    /** 人员table */
    self.staffTab = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.staffTab.delegate = self;
    self.staffTab.dataSource = self;
    self.staffTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.staffTab.backgroundColor = CLEARCOLOR;
    [self addSubview:self.staffTab];
    // tableview高度随数据高度变化而变化
    [self.staffTab setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}


#pragma mark - tableviewDegate、DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([tableView isEqual:self.divisionTab]) {
        return self.divisionAry.count;
    }else if ([tableView isEqual:self.staffTab]) {
        return self.staffAry.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:self.divisionTab]) {
        static NSString *cellID = @"divisionCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        }
        PGDivisionModel *divisionModel = [self.divisionAry objectAtIndex:indexPath.row];
        cell.textLabel.text = divisionModel.database;
        return cell;
    }else if ([tableView isEqual:self.staffTab]) {
        static NSString *cellID = @"staffCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        }
        PGStaffModel *staffModel = [self.staffAry objectAtIndex:indexPath.row];
        cell.textLabel.text = staffModel.name;
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([tableView isEqual:self.divisionTab]) {
        PGDivisionModel *divisionModel = [self.divisionAry objectAtIndex:indexPath.row];
        PGStaffModel *staffModel = [[PGStaffModel alloc] init];
        self.staffAry = [staffModel queryData:divisionModel.databaseID];
        [self.staffTab reloadData];
    }else if ([tableView isEqual:self.staffTab]) {
    }
}



#pragma makr - 布局方法
- (void)layoutSubviews {
    [super layoutSubviews];
    @weakify(self)
    /** 部门table */
    [self.divisionTab mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left);
        make.bottom.equalTo(self.mas_bottom);
        make.width.mas_equalTo(@100);
    }];
    /** tab分割线 */
    [self.tabLineVie mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.divisionTab.mas_right);
        make.bottom.equalTo(self.mas_bottom);
        make.width.mas_equalTo(@0.5);
    }];
    /** 人员table */
    [self.staffTab mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self)
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.tabLineVie.mas_right);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom);
    }];
}


@end
