//
//  RegsinView.h
//  FMDB数据库的使用
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegsinView : UIView
@property (nonatomic,strong)UILabel *userLab;
@property (nonatomic,strong)UILabel *passLab;
//@property (nonatomic,strong)UILabel *confirmPasswordLab;
//@property (nonatomic,strong)UILabel *emailLab;
//@property (nonatomic,strong)UILabel *telephoneLab;


@property (nonatomic,strong)UITextField *userText;
@property (nonatomic,strong)UITextField *passText;
//@property (nonatomic,strong)UITextField *confirmPassText;
//@property (nonatomic,strong)UITextField *emailText;
//@property (nonatomic,strong)UITextField *telephoneText;



@property (nonatomic,strong)UIButton *regsinBtn;

@end
