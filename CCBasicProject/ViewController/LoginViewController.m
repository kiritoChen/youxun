//
//  LoginViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/30.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "LoginViewController.h"
#import "FooterView.h"

@interface LoginViewController ()
@property (nonatomic) UIView *grayViewOne;
@property (nonatomic) UIView *grayViewTwo;
@property (nonatomic) UITextField *phoneNUmberTF;
@property (nonatomic) UITextField *passwordTF;
@property (nonatomic) FooterView *loginView;
@end

@implementation LoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self phoneNUmberTF];
    [self passwordTF];
    [self loginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark     - LazyLoad 懒加载
// 注册按钮视图
- (FooterView *)loginView {
    if(_loginView == nil) {
        _loginView = [[FooterView alloc] init];
        [self.view addSubview:_loginView];
        [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.grayViewTwo.mas_bottom).equalTo(20);
            make.height.equalTo(40);
            make.left.equalTo(0);
            make.right.equalTo(0);
        }];
        [_loginView.exitBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginView.exitBtn bk_addEventHandler:^(id sender) {
            NSString *phoneNum = self.phoneNUmberTF.text;
            NSString *pwd = self.passwordTF.text;
            BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
            if (!isAutoLogin) {
                [self.view showBusyHUD];
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    EMError *error = [[EMClient sharedClient] loginWithUsername:phoneNum password:pwd];
                    if (!error) {
                        [[EMClient sharedClient].options setIsAutoLogin:YES];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.navigationController popViewControllerAnimated:YES];
                        });
                        [self.view hideBusyHUD];
                        [kAppdelegate.window showWarning:@"登录成功，喵~"];
                    }else {
                        [self.view showWarning:error.errorDescription];
                    }
                });
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginView;
}
// 一号灰色背景视图
- (UIView *)grayViewOne{
    if (!_grayViewOne) {
        _grayViewOne = [UIView new];
        [self.view addSubview:_grayViewOne];
        [_grayViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(40);
            make.left.equalTo(15);
            make.right.equalTo(-15);
            make.top.equalTo(20);
        }];
        _grayViewOne.backgroundColor = kRGBA(242, 242, 242, 1);
        _grayViewOne.layer.cornerRadius = 20;
        _grayViewOne.layer.masksToBounds = YES;
    }
    return _grayViewOne;
}
// 输入手机号的框
- (UITextField *)phoneNUmberTF{
    if (!_phoneNUmberTF) {
        _phoneNUmberTF = [[UITextField alloc] init];
        [self.grayViewOne addSubview:_phoneNUmberTF];
        [_phoneNUmberTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.centerY.equalTo(0);
        }];
        _phoneNUmberTF.placeholder = @"请输入手机号，喵~~~";
        _phoneNUmberTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _phoneNUmberTF;
}

// 二号灰色背景视图------------------------
- (UIView *)grayViewTwo{
    if (!_grayViewTwo) {
        _grayViewTwo = [UIView new];
        [self.view addSubview:_grayViewTwo];
        [_grayViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.grayViewOne.mas_bottom).equalTo(20);
            make.height.equalTo(40);
            make.left.equalTo(15);
            make.right.equalTo(-15);
        }];
        _grayViewTwo.backgroundColor = kRGBA(242, 242, 242, 1);
        _grayViewTwo.layer.cornerRadius = 20;
        _grayViewTwo.layer.masksToBounds = YES;
    }
    return _grayViewTwo;
}
// 密码输入框
- (UITextField *)passwordTF{
    if (!_passwordTF) {
        _passwordTF = [[UITextField alloc] init];
        [self.grayViewTwo addSubview:_passwordTF];
        [_passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.centerY.equalTo(0);
        }];
        _passwordTF.placeholder = @"请输入密码，喵~~~";
        _passwordTF.secureTextEntry = YES;
    }
    return _passwordTF;
}

@end










