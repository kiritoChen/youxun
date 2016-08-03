//
//  HeaderView.m
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "HeaderView.h"
#define kIconWidth (kWindowW - 10 * 5) / 4
@implementation HeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = kRGBA(246, 246, 246, 1);
    }
    return self;
}
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [UIImageView new];
        [self addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(8);
            make.bottom.equalTo(-8);
            make.size.equalTo(CGSizeMake(kIconWidth, kIconWidth));
        }];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(8);
            make.left.equalTo(self.iconIV.mas_right).equalTo(8);
//            make.height.equalTo(15);
            make.right.equalTo(-8);
        }];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    return _titleLb;
}
- (UILabel *)priceLb
{
    if (!_priceLb) {
        _priceLb = [UILabel new];
        [self addSubview:_priceLb];
        [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).equalTo(8);
            make.top.equalTo(self.titleLb.mas_bottom).equalTo(15);
            make.right.equalTo(-8);
        }];
        _priceLb.textColor = [UIColor darkGrayColor];
        _priceLb.font = [UIFont systemFontOfSize:14];
    }
    return _priceLb;
}
- (UILabel *)attributeLb{
    if (!_attributeLb) {
        _attributeLb = [UILabel new];
        [self addSubview:_attributeLb];
        [_attributeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).equalTo(8);
            make.top.equalTo(self.priceLb.mas_bottom).equalTo(8);
            make.right.equalTo(-8);
            make.bottom.equalTo(-8);
        }];
        _attributeLb.textColor = [UIColor darkGrayColor];
        _attributeLb.font = [UIFont systemFontOfSize:14];
    }
    return _attributeLb;
}

@end










