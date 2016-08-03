//
//  ThreePicCell.m
//  CCBasicProject
//
//  Created by chenc on 16/6/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "ThreePicCell.h"

@implementation ThreePicCell
- (NSArray<UIImageView *> *)imageViews{
    if (!_imageViews) {
        _imageViews = [NSArray<UIImageView *> new];
        // 间隔8, 274/212
        NSMutableArray *tmpArr = [NSMutableArray new];
        UIView *lastView = nil;
        for (int i = 0; i < 3; i++) {
            UIImageView *imageView = [UIImageView new];
            [self.contentView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                if (!lastView) {
                    make.left.equalTo(8);
                }else{
                    make.width.equalTo(lastView);
                    make.left.equalTo(lastView.mas_right).equalTo(8);
                }
                if (i == 2) {
                    make.right.equalTo(-8);
                }
                make.top.equalTo(self.titleLb.mas_bottom).equalTo(8);
                make.bottom.equalTo(-8);
                make.height.equalTo(imageView.mas_width).multipliedBy(212 / 274.0);
            }];
            lastView = imageView;
            [tmpArr addObject:imageView];
            imageView.clipsToBounds = YES;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
        }
        _imageViews = tmpArr.copy;
    }
    return _imageViews;
}
- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.top.equalTo(8);
            make.height.equalTo(20).priorityHigh();
        }];
    }
    return _titleLb;
}
- (UILabel *)clicksLb{
    if (!_clicksLb) {
        _clicksLb = [UILabel new];
        [self.contentView addSubview:_clicksLb];
        [_clicksLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-8);
            make.top.equalTo(self.titleLb);
        }];
        _clicksLb.font = [UIFont systemFontOfSize:14];
        _clicksLb.textColor = [UIColor darkGrayColor];
    }
    return _clicksLb;
}
@end
