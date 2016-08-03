//
//  FooterView.m
//  CCBasicProject
//
//  Created by chenc on 16/7/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self exitBtn];
    }
    return self;
}
- (UIButton *)exitBtn{
    if (!_exitBtn) {
        _exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_exitBtn];
        [_exitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(14);
            make.right.equalTo(-14);
            make.top.bottom.equalTo(0);
        }];
//        _exitBtn.backgroundColor = [UIColor redColor];
//        _exitBtn.layer.cornerRadius = 20;
//        _exitBtn.layer.masksToBounds = YES;
        [_exitBtn setTitle:@"点我登录，喵~" forState:UIControlStateNormal];
        [_exitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_exitBtn setBackgroundImage:[UIImage imageNamed:@"按钮背景"] forState:UIControlStateNormal];
        [_exitBtn setBackgroundImage:[UIImage imageNamed:@"按钮背景选择"] forState:UIControlStateHighlighted];
        
    }
    return _exitBtn;
}

@end
