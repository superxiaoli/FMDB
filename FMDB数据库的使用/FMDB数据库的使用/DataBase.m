//
//  DataBase.m
//  FMDB数据库的使用
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 李帅. All rights reserved.
//

#import "DataBase.h"

//static DataBase *dbhandler = nil;

@implementation DataBase

//+(instancetype)shareDataBase
//{
//    if (dbhandler == nil)
//    {
//        dbhandler = [[DataBase alloc]init];
//    }
//    return dbhandler;
//}
-(void)open
{
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName=[doc stringByAppendingPathComponent:@"user.sqlite"];

    //2.获得数据库
    FMDatabase *db=[FMDatabase databaseWithPath:fileName];
    //3.打开数据库
    if ([db open])
    {
            //4.创表
            BOOL result=[db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_user (userName text PRIMARY KEY AUTOINCREMENT, userPassword text NOT NULL);"];
            if (result)
            {
                NSLog(@"创表成功");
            }
            else
            {
                NSLog(@"创表失败");
            }
     }
     self.db = db;
}
-(void)insert:(NSString *)aName Password:(NSString *)aPassWord
{
    for (int i = 0; i<10; i++) {
        //NSString *name = aName;
            // executeUpdate : 不确定的参数用?来占位
            [self.db executeUpdate:@"INSERT INTO t_user (userName, userPassword) VALUES (?, ?);", aName, aPassWord];
            //        [self.db executeUpdate:@"INSERT INTO t_student (name, age) VALUES (?, ?);" withArgumentsInArray:@[name, @(arc4random_uniform(40))]];

            // executeUpdateWithFormat : 不确定的参数用%@、%d等来占位
            //        [self.db executeUpdateWithFormat:@"INSERT INTO t_student (name, age) VALUES (%@, %d);", name, arc4random_uniform(40)];
        }
   
}
-(void)delete1
{
    //    [self.db executeUpdate:@"DELETE FROM t_student;"];
    [self.db executeUpdate:@"DROP TABLE IF EXISTS t_user;"];
    [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_user (userName text PRIMARY KEY AUTOINCREMENT, userPassword text NOT NULL);"];
    
}
-(BOOL)query:(NSString *)aName PassWord:(NSString *)aPassWord
{
    // 1.执行查询语句
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM t_user"];
    NSString *name;
    NSString *password;
    
    // 2.遍历结果
    while ([resultSet next])
    {
         name = [resultSet stringForColumn:@"userName"];
         password = [resultSet stringForColumn:@"userPassword"];
        
        
    }
    
    
    if ([name isEqualToString:aName] && [password isEqualToString:aPassWord])
    {
        return YES;
    }
    else
    {
        return NO;
    }
    
    
}













@end
