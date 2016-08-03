//
//  NormalCell.m
//  CCBasicProject
//
//  Created by chenc on 16/7/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "NormalCell.h"

@implementation NormalCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self titleLb];
        [self descLb];
    }
    return self;
}

- (UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(CGSizeMake(25, 25));
            make.left.equalTo(8);
            make.centerY.equalTo(0);
        }];
        _imageV.contentMode = UIViewContentModeScaleAspectFill;
        _imageV.clipsToBounds = YES;
    }
    return _imageV;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageV.mas_right).equalTo(8);
            make.centerY.equalTo(0);
        }];
    }
    return _titleLb;
}
- (UILabel *)descLb{
    if (!_descLb) {
        _descLb = [UILabel new];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.centerY.equalTo(0);
        }];
        _descLb.textColor = [UIColor darkGrayColor];
        _descLb.font = [UIFont systemFontOfSize:12];
    }
    return _descLb;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
