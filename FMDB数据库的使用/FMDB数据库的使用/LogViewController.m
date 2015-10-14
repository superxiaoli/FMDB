//
//  LogViewController.m
//  FMDB数据库的使用
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 李帅. All rights reserved.
//

#import "LogViewController.h"
#import "LogicView.h"
#import "ShowViewController.h"
#import "RegsinViewController.h"
#import "FMDB.h"
@interface LogViewController ()
@property (nonatomic,strong)LogicView *lv;
@property (nonatomic,strong)FMDatabase *db;

@end

@implementation LogViewController

-(void)loadView
{
    self.lv = [[LogicView alloc]init];
    self.view = _lv;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.lv.logButton addTarget:self action:@selector(logButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.lv.registButton addTarget:self action:@selector(registButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
   
    
    
    
    
}

-(void)logButtonAction:(UIButton *)sender
{
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [doc stringByAppendingPathComponent:@"user.sqlite"];
    NSLog(@"%@",fileName);
    
    //2.获得数据库
    FMDatabase *db = [FMDatabase databaseWithPath:fileName];
    NSString * name;
    NSString *password;
    if ([db open])
    {
        FMResultSet *resultSet = [db executeQuery:@"SELECT * FROM t_user"];
        //    NSString * name = [resultSet stringForColumn:@"userName"];
        //    NSString *password = [resultSet stringForColumn:@"userPassword"];
        
       
        while ([resultSet next])
        {
            name = [resultSet stringForColumn:@"userName"];
            password = [resultSet stringForColumn:@"userPassword"];
            
            NSLog(@"%@ %@",name,password);
            if ([self.lv.userTextField.text isEqualToString:name]&&[self.lv.passTextField.text isEqualToString:password])
            {
                ShowViewController *showVC = [[ShowViewController alloc]init];
                [self.navigationController pushViewController:showVC animated:YES];
                
            }
        }
        

    }
  
}

-(void)registButtonAction:(UIButton *)sender
{
    RegsinViewController *regsinVC = [[RegsinViewController alloc]init];
    [self.navigationController pushViewController:regsinVC animated:YES];
    
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
