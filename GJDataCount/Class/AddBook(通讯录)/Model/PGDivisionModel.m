//
//  PGDivisionModel.m
//  GJDataCount
//
//  Created by apple on 2018/1/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PGDivisionModel.h"
#import "FMDB.h"

@interface PGDivisionModel ()

/** 创建数据库操作 */
@property (nonatomic, strong) FMDatabase *fmdb;
/** 数据库是否打开成功 */
@property (nonatomic, assign) BOOL isOpen;

@end

@implementation PGDivisionModel

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
    NSLog(@"%@", path);
    // 打开数据库
    self.fmdb = [FMDatabase databaseWithPath:path];
    return [self.fmdb open];
}

/** 创建数据库表 */
- (void)createDatabaseTables {
    // 判断打开数据库成功
    if (self.isOpen) {
        // 创建数据库表
        [self.fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS division (ID integer PRIMARY KEY, database text NOT NULL, databaseID integer NOT NULL)"];
        [self.fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS staff (ID integer PRIMARY KEY, staffID integer NOT NULL, img_url text NOT NULL, name text NOT NULL, phone text NOT NULL, mark integer NOT NULL, databaseID integer NOT NULL, database text NOT NULL)"];
    }
}

/** 增加数据 */
- (void)addData:(PGDivisionModel *)databaseModel {
    // 判断打开数据库成功
    if (self.isOpen && databaseModel) {
        // 增加数据
        [self.fmdb executeUpdateWithFormat:@"INSERT INTO division (database, databaseID) VALUES (%@, %ld);", databaseModel.database, databaseModel.databaseID];
    }
}

/** 查询全部数据 */
- (NSMutableArray *)queryData {
    // 初始化一个数组
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    // 查询数据语句
    FMResultSet *set = [self.fmdb executeQuery:@"SELECT * FROM division;"];
    while (set.next) {
        PGDivisionModel *divisionModel = [[PGDivisionModel alloc] init];
        divisionModel.databaseID = [set intForColumn:@"databaseID"];
        divisionModel.database = [set stringForColumn:@"database"];
        [dataArray addObject:divisionModel];
    }
    return dataArray;
}

/** 查询某一部门 */
- (NSMutableArray *)queryData:(NSInteger)databaseId {
    // 初始化一个数组
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    // 查询数据语句
    FMResultSet *set = [self.fmdb executeQuery:[NSString stringWithFormat:@"SELECT * FROM division WHERE ID LIKE '%ld';", databaseId]];
    while (set.next) {
        PGDivisionModel *divisionModel = [[PGDivisionModel alloc] init];
        divisionModel.databaseID = [set intForColumn:@"databaseID"];
        divisionModel.database = [set stringForColumn:@"database"];
        [dataArray addObject:divisionModel];
    }
    return dataArray;
}


@end
