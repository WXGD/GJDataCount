//
//  PGStaffModel.h
//  GJDataCount
//
//  Created by apple on 2018/1/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PGStaffModel : NSObject

/** 员工ID */
@property (assign, nonatomic) NSInteger staffID;
/** 名字 */
@property (copy, nonatomic) NSString *name;
/** 电话 */
@property (copy, nonatomic) NSString *phone;
/** 头像 */
@property (copy, nonatomic) NSString *headImg;
/** 是否关注（0：未关注，1：已经关注） */
@property (assign, nonatomic) NSInteger isFollow;
/** 部门ID */
@property (assign, nonatomic) NSInteger databaseID;
/** 部门 */
@property (copy, nonatomic) NSString *database;

/** 增加数据 */
- (void)addData:(PGStaffModel *)staffModel;
/** 查询某个部门的数据 */
- (NSMutableArray *)queryData:(NSInteger)divisionId;

@end
