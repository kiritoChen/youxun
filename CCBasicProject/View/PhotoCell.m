//
//  PhotoCell.m
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.photoIV];
        [_photoIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
        }];
        
        [self.contentView addSubview:self.titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
        
        [self.photoIV addSubview:self.grayView];
        [_grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(15);
            make.left.right.bottom.equalTo(0);
        }];
        
        [self.grayView addSubview:self.picSumLb];
        [_picSumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(0);
        }];
        
        [self.grayView addSubview:self.commentCountLb];
        [_commentCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.equalTo(0);
            make.width.equalTo(_picSumLb);
        }];
        
    }
    return self;
}

- (UIImageView *)photoIV{
    if (!_photoIV) {
        _photoIV = [UIImageView new];
        _photoIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _photoIV;
}
- (UIView *)grayView{
    if (!_grayView) {
        _grayView = [UIView new];
        _grayView.backgroundColor = kRGBA(0, 0, 0, 0.7);
    }
    return _grayView;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.numberOfLines = 2;
    }
    return _titleLb;
}
- (UILabel *)picSumLb{
    if (!_picSumLb) {
        _picSumLb = [UILabel new];
        _picSumLb.textColor = [UIColor lightGrayColor];
        _picSumLb.font = [UIFont systemFontOfSize:13];
    }
    return _picSumLb;
}
- (UILabel *)commentCountLb{
    if (!_commentCountLb) {
        _commentCountLb = [UILabel new];
        _commentCountLb.textColor = [UIColor lightGrayColor];
        _commentCountLb.font = [UIFont systemFontOfSize:13];
    }
    return _commentCountLb;
}

@end
