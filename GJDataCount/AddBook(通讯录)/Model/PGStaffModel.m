//
//  PGStaffModel.m
//  GJDataCount
//
//  Created by apple on 2018/1/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PGStaffModel.h"
#import "FMDB.h"

@interface PGStaffModel ()

/** 创建数据库操作 */
@property (nonatomic, strong) FMDatabase *fmdb;
/** 数据库是否打开成功 */
@property (nonatomic, assign) BOOL isOpen;

@end

@implementation PGStaffModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.isOpen = [self openDatabase];
    }
    return self;
}


/** 打开数据库 */
- (BOOL)openDatabase {
    // 储存路径
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"business" ofType:@"sqlite"];
    NSString *path = @"/Users/apple/Desktop/GJDataCount/GJDataCount/AddBook(通讯录)/Model/business.sqlite";
//    NSString * path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"business.sqlite"];
//    PDLog(@"%@", path);
    // 打开数据库
    self.fmdb = [FMDatabase databaseWithPath:path];
    return [self.fmdb open];
}

/** 增加数据 */
- (void)addData:(PGStaffModel *)staffModel {
    // 判断打开数据库成功
    if (self.isOpen && staffModel) {
        // 增加数据
        [self.fmdb executeUpdateWithFormat:@"INSERT INTO staff (staffID, img_url, name, phone, mark, databaseID, database) VALUES (%ld, %@, %@, %@, %ld, %ld, %@);", staffModel.staffID, staffModel.headImg, staffModel.name, staffModel.phone, staffModel.isFollow, staffModel.databaseID, staffModel.database];
    }
}



/** 查询某个部门的数据 */
- (NSMutableArray *)queryData:(NSInteger)divisionId {
    // 初始化一个数组
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    // 查询数据语句
    FMResultSet *set = [self.fmdb executeQuery:[NSString stringWithFormat:@"SELECT * FROM staff WHERE databaseID LIKE '%ld';", divisionId]];
    while (set.next) {
        PGStaffModel *staffModel = [[PGStaffModel alloc] init];
        staffModel.staffID = [set intForColumn:@"staffID"];
        staffModel.name = [set stringForColumn:@"name"];
        staffModel.phone = [set stringForColumn:@"phone"];
        staffModel.headImg = [set stringForColumn:@"img_url"];
        staffModel.isFollow = [set intForColumn:@"mark"];
        staffModel.databaseID = [set intForColumn:@"databaseID"];
        staffModel.database = [set stringForColumn:@"database"];
        [dataArray addObject:staffModel];
    }
    return dataArray;
}


@end
