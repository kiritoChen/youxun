//
//  OnePicCell.m
//  CCBasicProject
//
//  Created by chenc on 16/6/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "OnePicCell.h"

@implementation OnePicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self iconIV];
        [self titleLb];
        [self detailLb];
        [self clickLb];
        self.separatorInset = UIEdgeInsetsZero;
        self.layoutMargins = UIEdgeInsetsZero;
        self.preservesSuperviewLayoutMargins = NO;
    }
    return self;
}

- (UIImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [UIImageView new];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(110, 80));
            make.left.equalTo(8);
            make.top.equalTo(8);
            make.bottom.equalTo(-8);
        }];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
    }
    return _iconIV;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).equalTo(8);
            make.right.equalTo(-8);
            make.top.equalTo(self.iconIV).equalTo(4);
            make.height.equalTo(20);
        }];
    }
    return _titleLb;
}
- (UILabel *)detailLb{
    if (!_detailLb) {
        _detailLb = [UILabel new];
        [self.contentView addSubview:_detailLb];
        [_detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLb);
            make.right.equalTo(self.titleLb);
            make.top.equalTo(self.titleLb.mas_bottom).equalTo(8);
        }];
        _detailLb.numberOfLines = 0;
        _detailLb.textColor = [UIColor darkGrayColor];
        _detailLb.font = [UIFont systemFontOfSize:15];
    }
    return _detailLb;
}
- (UILabel *)clickLb{
    if (!_clickLb) {
        _clickLb = [UILabel new];
        [self.contentView addSubview:_clickLb];
        [_clickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.detailLb);
            make.bottom.equalTo(self.iconIV);
        }];
        _clickLb.textColor = [UIColor darkGrayColor];
        _clickLb.font = [UIFont systemFontOfSize:13];
    }
    return _clickLb;
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
