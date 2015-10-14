//
//  ShowViewController.m
//  FMDB数据库的使用
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 李帅. All rights reserved.
//

#import "ShowViewController.h"
#import "ShowView.h"
#import "FMDB.h"
@interface ShowViewController ()
@property (nonatomic,strong)ShowView *sv;


@end

@implementation ShowViewController

-(void)loadView
{
    self.sv = [[ShowView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view = _sv;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.sv.backgroundColor = [UIColor redColor];
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
