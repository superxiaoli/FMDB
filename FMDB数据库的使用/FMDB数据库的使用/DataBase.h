//
//  DataBase.h
//  FMDB数据库的使用
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 李帅. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@interface DataBase : NSObject
@property(nonatomic,strong)FMDatabase *db;

//+(instancetype)shareDataBase;

-(void)open;
-(void)insert:(NSString *)aName Password:(NSString *)aPassWord;
-(void)delete1;
-(BOOL)query:(NSString *)aName PassWord:(NSString *)aPassWord;




@end