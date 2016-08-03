//
//  RegisterViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/30.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "RegisterViewController.h"
#import "FooterView.h"
#import <SMS_SDK/SMSSDK.h>

@interface RegisterViewController ()
@property (nonatomic) UIView *grayViewOne;
@property (nonatomic) UIView *grayViewTwo;
@property (nonatomic) UIView *grayViewThree;
@property (nonatomic) UITextField *phoneNUmberTF;
@property (nonatomic) UITextField *captchaCodeTF;
@property (nonatomic) UITextField *passwordTF;
@property (nonatomic) UIButton *getCaptchaBtn;
@property (nonatomic) FooterView *loginView;
@property (nonatomic) NSString *verifCode;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self grayViewOne];
    [self grayViewTwo];
    [self getCaptchaBtn];
    [self captchaCodeTF];
    [self loginView];
    [self passwordTF];
}
#pragma mark - Method
// ------------注册按钮点击事件-----------------
- (void)clickLoginButton:sender{
    NSString *phoneNum = self.phoneNUmberTF.text;
    NSString *pwd = self.passwordTF.text;
    NSString *validCode = self.captchaCodeTF.text;
    if (validCode.length == 0) {
        [self.view showWarning:@"请输入验证码，喵~"];
        return;
    }
    if (pwd.length <= 6) {
        [self.view showWarning:@"请输入至少6位密码，喵~"];
        return;
    }
    if (![Tools isPhoneNumber:phoneNum]) {
        [self.view showWarning:@"请输入正确的手机号，喵~"];
        return;
    }
    [SMSSDK commitVerificationCode:validCode phoneNumber:phoneNum zone:@"86" result:^(NSError *error) {
        if (error) {
            [self.view showWarning:error.localizedDescription];
        }else {
            // 环信进行注册
            EMError *error = [[EMClient sharedClient] registerWithUsername:phoneNum password:pwd];
            if (error == nil) {
                [self.navigationController popViewControllerAnimated:YES];
                [kAppdelegate.window showWarning:@"注册成功"];
            }
        }
    }];
    
    
    
}
// ------------获取验证码-----------------
- (void)getVerificationCode{
    // 点击获取验证码之后更改title为倒计时60s
    _verifCode = self.phoneNUmberTF.text;
    if (![Tools isPhoneNumber:_verifCode]) {
        [self.view showWarning:@"请输入正确的手机号码，喵~~~"];
        return;
    }
    [self.view hideBusyHUD];
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_verifCode zone:@"86" customIdentifier:@"" result:^(NSError *error) {
        [self.view hideBusyHUD];
        if (error) {
            [self.view showWarning:error.localizedDescription];
        }else {
            __block NSInteger duration = 59;
            _getCaptchaBtn.enabled = NO;
            [_getCaptchaBtn setTitle:@"60s后获取" forState:UIControlStateNormal];
            [NSTimer bk_scheduledTimerWithTimeInterval:1 block:^(NSTimer *timer) {
                NSString *title = [NSString stringWithFormat:@"%lds后获取", duration--];
                [_getCaptchaBtn setTitle:title forState:UIControlStateNormal];
                if (duration == 0) {
                    [timer invalidate];
                    _getCaptchaBtn.enabled = YES;
                    [_getCaptchaBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                }
            } repeats:YES];
        }
    }];
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
            make.top.equalTo(self.grayViewThree.mas_bottom).equalTo(20);
            make.height.equalTo(40);
            make.left.equalTo(0);
            make.right.equalTo(0);
        }];
        [_loginView.exitBtn addTarget:self action:@selector(clickLoginButton:) forControlEvents:UIControlEventTouchUpInside];
        [_loginView.exitBtn setTitle:@"注册" forState:UIControlStateNormal];
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

// 三号灰色背景视图------------------------
- (UIView *)grayViewThree{
    if (!_grayViewThree) {
        _grayViewThree = [UIView new];
        [self.view addSubview:_grayViewThree];
        [_grayViewThree mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.grayViewTwo.mas_bottom).equalTo(20);
            make.height.equalTo(40);
            make.left.equalTo(15);
            make.right.equalTo(-15);
        }];
        _grayViewThree.backgroundColor = kRGBA(242, 242, 242, 1);
        _grayViewThree.layer.cornerRadius = 20;
        _grayViewThree.layer.masksToBounds = YES;
    }
    return _grayViewThree;
}
// 获取验证码的按钮
- (UIButton *)getCaptchaBtn{
    if (!_getCaptchaBtn) {
        _getCaptchaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.grayViewThree addSubview:_getCaptchaBtn];
        [_getCaptchaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(80, 30));
            make.left.equalTo(self.phoneNUmberTF.mas_right).equalTo(10);
        }];
        _getCaptchaBtn.layer.cornerRadius = 15;
        _getCaptchaBtn.layer.masksToBounds = YES;
        _getCaptchaBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_getCaptchaBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_getCaptchaBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        _getCaptchaBtn.backgroundColor = kRGBA(148, 206, 243, 1);
        [_getCaptchaBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_getCaptchaBtn addTarget:self action:@selector(getVerificationCode) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getCaptchaBtn;
}
// 验证码输入框
- (UITextField *)captchaCodeTF{
    if (!_captchaCodeTF) {
        _captchaCodeTF = [[UITextField alloc] init];
        [self.grayViewThree addSubview:_captchaCodeTF];
        [_captchaCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.centerY.equalTo(0);
        }];
        _captchaCodeTF.placeholder = @"请输入收到的验证码，喵~~~";
        _captchaCodeTF.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _captchaCodeTF;
}

@end
