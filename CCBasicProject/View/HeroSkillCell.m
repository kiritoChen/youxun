//
//  HeroSkillCell.m
//  CCBasicProject
//
//  Created by chenc on 16/7/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "HeroSkillCell.h"

@implementation HeroSkillCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self skillDescLb];
        [self skillIconIV];
    }
    return self;
}
- (UIImageView *)skillIconIV{
    if (!_skillIconIV) {
        _skillIconIV = [UIImageView new];
        [self.contentView addSubview:_skillIconIV];
        [_skillIconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(8);
            make.size.equalTo(CGSizeMake(64, 64));
        }];
        _skillIconIV.contentMode = UIViewContentModeScaleAspectFill;
        _skillIconIV.layer.cornerRadius = 8;
        _skillIconIV.layer.masksToBounds = YES;
    }
    return _skillIconIV;
}
- (UILabel *)skillNameLb{
    if (!_skillNameLb) {
        _skillNameLb = [UILabel new];
        [self.contentView addSubview:_skillNameLb];
        [_skillNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(8);
            make.left.equalTo(self.skillIconIV.mas_right).equalTo(8);
            make.height.equalTo(20);
        }];
    }
    return _skillNameLb;
}
- (UILabel *)skillDescLb{
    if (!_skillDescLb) {
        _skillDescLb = [UILabel new];
        [self.contentView addSubview:_skillDescLb];
        [_skillDescLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.skillNameLb.mas_bottom).equalTo(8);
            make.left.equalTo(self.skillIconIV.mas_right).equalTo(8);
            make.right.bottom.equalTo(-8);
        }];
        _skillDescLb.numberOfLines = 0;
        _skillDescLb.font = [UIFont systemFontOfSize:17];
    }
    return _skillDescLb;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
