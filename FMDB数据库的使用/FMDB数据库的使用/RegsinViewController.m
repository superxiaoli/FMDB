//
//  RegsinViewController.m
//  FMDB数据库的使用
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 李帅. All rights reserved.
//

#import "RegsinViewController.h"
#import "RegsinView.h"
#import "FMDB.h"
@interface RegsinViewController ()
@property (nonatomic,strong)RegsinView *rv;
@property(nonatomic,strong)FMDatabase *db;

@end

@implementation RegsinViewController

-(void)loadView
{
    self.rv = [[RegsinView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view =_rv;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.rv.regsinBtn addTarget:self action:@selector(regsinBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}

-(void)regsinBtnAction:(UIButton *)sender
{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [doc stringByAppendingPathComponent:@"user.sqlite"];
    
    //2.获得数据库
    FMDatabase *db=[FMDatabase databaseWithPath:fileName];
    //3.打开数据库
    if ([db open])
    {
        //4.创表
        BOOL result=[db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_user (userName text PRIMARY KEY NOT NULL, userPassword text NOT NULL);"];
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

    [self.db executeUpdate:@"INSERT INTO t_user (userName, userPassword) VALUES (?, ?);", self.rv.userText.text, self.rv.passText.text];
    
    
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM t_user"];
    NSString *name;
    NSString *password;
    
    // 2.遍历结果
    while ([resultSet next])
    {
        name = [resultSet stringForColumn:@"userName"];
        password = [resultSet stringForColumn:@"userPassword"];
        
        NSLog(@"%@ %@",name,password);
    }
    [resultSet close];
    [db close];

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
