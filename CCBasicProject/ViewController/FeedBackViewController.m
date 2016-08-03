//
//  FeedBackViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/8/1.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "FeedBackViewController.h"
#import "FooterView.h"

@interface FeedBackViewController ()<UITextViewDelegate>
@property (nonatomic) UITextView *textView;
@property (nonatomic) FooterView *footerView;
@property (nonatomic) UITextField *textTF;
@property (nonatomic) UIView *grayView;
@end
static void *con = &con;
@implementation FeedBackViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 添加键盘监听事件
    // 注册通知,监听键盘弹出事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillChangeFram:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)keyBoardWillChangeFram:(NSNotification *)noti{
    // 取得键盘的动画时间
    NSLog(@"niti: %@", noti.userInfo);
    NSTimeInterval duratiton = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions option = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    CGRect endRect = [noti.userInfo [UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat height = kWindowH - endRect.origin.y;
    [UIView animateWithDuration:duratiton delay:0 options:option animations:^{
        [self.grayView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-height);
        }];
    } completion:nil];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRGBA(247, 247, 247, 1);
    [self footerView];
    [self textTF];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -  Delegate
// 点击空白处回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    _textView.text = @"";
    return YES;
}
#pragma mark     - LazyLoad 懒加载
- (UITextView *)textView {
	if(_textView == nil) {
		_textView = [[UITextView alloc] init];
        [self.view addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(15);
            make.right.equalTo(-15);
            make.height.equalTo(150);
        }];
        _textView.font = [UIFont systemFontOfSize:18];
        _textView.text = @"请输入您的意见，喵~";
        if ([_textView.text isEqualToString:@"请输入您的意见，喵~"]) {
            _textView.textColor = [UIColor lightGrayColor];
        }
        _textView.delegate = self;
        _textView.layer.cornerRadius = 5;
        _textView.tag = 100;
        _textView.layer.borderWidth = 2;
        _textView.layer.borderColor = [UIColor redColor].CGColor;
	}
	return _textView;
}

- (FooterView *)footerView {
	if(_footerView == nil) {
		_footerView = [[FooterView alloc] init];
        [self.view addSubview:_footerView];
        [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textView.mas_bottom).equalTo(20);
            make.left.right.equalTo(0);
            make.height.equalTo(40);
        }];
        [_footerView.exitBtn setTitle:@"提交，喵~" forState:UIControlStateNormal];
	}
	return _footerView;
}

- (UITextField *)textTF {
	if(_textTF == nil) {
		_textTF = [[UITextField alloc] init];
        [self.grayView addSubview:_textTF];
        [_textTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(3);
            make.right.bottom.equalTo(-3);
        }];
        _textTF.layer.cornerRadius = 3;
        _textTF.layer.masksToBounds = YES;
        _textTF.backgroundColor = [UIColor whiteColor];
	}
	return _textTF;
}

- (UIView *)grayView {
	if(_grayView == nil) {
		_grayView = [[UIView alloc] init];
        [self.view addSubview:_grayView];
        [_grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(40);
        }];
        _grayView.backgroundColor = kBGColor;
	}
	return _grayView;
}

@end
