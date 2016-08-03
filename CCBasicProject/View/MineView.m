//
//  MineView.m
//  CCBasicProject
//
//  Created by chenc on 16/7/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "MineView.h"

@implementation MineView
- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self userNameLb];
    }
    return self;
}
- (UIImageView *)backgroundIV{
    if (!_backgroundIV) {
        _backgroundIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"背景1"]];
        [self addSubview:_backgroundIV];
        _backgroundIV.alpha = 0.7;
        [_backgroundIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _backgroundIV.contentMode = UIViewContentModeScaleAspectFill;
        _backgroundIV.clipsToBounds = YES;
    }
    return _backgroundIV;
}
- (UIButton *)avatarBtn{
    if (!_avatarBtn) {
        _avatarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.backgroundIV addSubview:_avatarBtn];
        [_avatarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(80, 80));
        }];
        _avatarBtn.layer.cornerRadius = 40;
        _avatarBtn.layer.masksToBounds = YES;
        _avatarBtn.layer.borderWidth = 1;
        _avatarBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _avatarBtn;
}
- (UILabel *)userNameLb{
    if (!_userNameLb) {
        _userNameLb = [UILabel new];
        [self.backgroundIV addSubview:_userNameLb];
        [_userNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.avatarBtn.mas_bottom).equalTo(8);
            make.centerX.equalTo(0);
        }];
        _userNameLb.text = @"user1111";
        _userNameLb.textAlignment = NSTextAlignmentCenter;
        _userNameLb.textColor = [UIColor darkTextColor];
    }
    return _userNameLb;
}

@end
