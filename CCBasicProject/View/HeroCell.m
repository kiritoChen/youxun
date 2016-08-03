//
//  HeroCell.m
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "HeroCell.h"
#define kIconWidth (kWindowW - 10 * 5) / 4
@implementation HeroCell
- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
            make.height.equalTo(kIconWidth);
        }];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV;
}
- (UILabel *)cnNameLb{
    if (!_cnNameLb) {
        _cnNameLb = [UILabel new];
        [self.contentView addSubview:_cnNameLb];
        [_cnNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(self.iconIV.mas_bottom).equalTo(2);
        }];
        _cnNameLb.textAlignment = NSTextAlignmentCenter;
        _cnNameLb.font = [UIFont systemFontOfSize:16];
    }
    return _cnNameLb;
}
@end
