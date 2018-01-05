//
//  PGDivisionModel.h
//  GJDataCount
//
//  Created by apple on 2018/1/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PGDivisionModel : NSObject

/** 部门ID */
@property (assign, nonatomic) NSInteger databaseID;
/** 部门名称 */
@property (copy, nonatomic) NSString *database;

/** 创建数据库表 */
- (void)createDatabaseTables;
/** 增加数据 */
- (void)addData:(PGDivisionModel *)databaseModel;
/** 查询全部数据 */
- (NSMutableArray *)queryData;

@end
