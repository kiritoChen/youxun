//
//  FreeHeroCell.m
//  CCBasicProject
//
//  Created by chenc on 16/7/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "FreeHeroCell.h"

@implementation FreeHeroCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(0);
            make.size.equalTo(CGSizeMake(50, 50));
        }];
        
        [self.contentView addSubview:self.titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).equalTo(8);
            make.top.equalTo(self.iconIV);
            make.right.equalTo(-8);
            make.height.equalTo(15);
        }];
        
        [self.contentView addSubview:self.cnNameLb];
        [_cnNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLb);
            make.top.equalTo(self.titleLb.mas_bottom).equalTo(4);
            make.right.equalTo(-8);
            make.height.equalTo(12);
        }];
        
        [self.contentView addSubview:self.locationLb];
        [_locationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.cnNameLb.mas_bottom).equalTo(4);
            make.left.equalTo(self.titleLb);
            make.bottom.equalTo(self.iconIV);
            make.right.equalTo(-8);
        }];
    }
    return self;
}
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [UIImageView new];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
    }
    return _iconIV;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:16];
    }
    return _titleLb;
}

- (UILabel *)cnNameLb{
    if (!_cnNameLb) {
        _cnNameLb = [UILabel new];
        _cnNameLb.font = [UIFont systemFontOfSize:11];
        _cnNameLb.textColor = [UIColor darkGrayColor];
    }
    return _cnNameLb;
}

- (UILabel *)locationLb{
    if (!_locationLb) {
        _locationLb = [UILabel new];
        _locationLb.textColor = kRGBA(45, 65, 125, 1);
        _locationLb.font = [UIFont systemFontOfSize:13];
    }
    return _locationLb;
}


@end
