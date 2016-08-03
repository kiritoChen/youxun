//
//  DWViewModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/26.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "DWViewModel.h"

@implementation DWViewModel
- (instancetype)initNewsType:(DWRequestMode)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

- (NSInteger)numberForRow{
    return self.dataList.count;
}
- (DWNewsDataModel *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}
- (NSString *)titleForRow:(NSInteger)row{
    return [self modelForRow:row].title;
}
- (NSURL *)srcPhotoForRow:(NSInteger)row{
    return [self modelForRow:row].srcPhoto.cc_URL;
}
- (NSString *)readCountForRow:(NSInteger)row{
    double read = [self modelForRow:row].readCount.doubleValue;
    if (read >= 10000) {
        return [NSString stringWithFormat:@"%.1f万浏览", read / 10000.0];
    }
    return [NSString stringWithFormat:@"%.f浏览", read];
}
- (NSString *)contentForRow:(NSInteger)row{
    return [self modelForRow:row].content;
}
- (NSURL *)artIdForRow:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:kNewsAddress, [self modelForRow:row].artId];
    return path.cc_URL;
}

// 资讯
- (void)getDataRequestModel:(VMDataRequestModel)request CompletionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 0;
    if (request == VMDataRequestModelRefresh) {
        [self.dataList removeAllObjects];
        tmpPage = 1;
    } else {
        tmpPage = _page + 1;
    }
    [DWNetManager getDWDataPage:tmpPage requestMode:_type completionHandler:^(DWNewsModel *model, NSError *error) {
        [self.dataList addObjectsFromArray:model.data];
        self.page = tmpPage;
        completionHandler(error);
    }];
}

// 图片----begain
- (NSInteger)numberForIndex{
    return self.dataList.count;
}
- (NSString *)havePicSumForIndex:(NSInteger)index{
    NSInteger num = [self modelForIndex:index].picsum.integerValue;
    return [NSString stringWithFormat:@"%ld张", num];
}
- (NSURL *)coverForIndex:(NSInteger)index{
    return [self modelForIndex:index].coverUrl.cc_URL;
}
- (CGSize)coverSizeForIndex:(NSInteger)index{
    return CGSizeMake([self modelForIndex:index].coverWidth.doubleValue, [self modelForIndex:index].coverHeight.doubleValue);
}
- (NSString *)commentCountForIndex:(NSInteger)index{
    double comment = [self modelForIndex:index].commentCount.doubleValue;
    if (comment >= 10000) {
        return [NSString stringWithFormat:@"%.1f万评论", comment / 10000.0];
    }
    return [NSString stringWithFormat:@"%.f评论", comment];
}
- (DWNewsDataModel *)modelForIndex:(NSInteger)index{
    return self.dataList[index];
}
- (NSString *)titleForIndex:(NSInteger)index{
    return [self modelForIndex:index].title;
}
- (NSString *)galleryIdForIndex:(NSInteger)index{
    return [self modelForRow:index].galleryId;
}
// 图片----end

- (NSMutableArray<DWNewsDataModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

// 图片详情
- (NSInteger)picSum{
    return self.picList.count;
}
- (DWPicPicturesModel *)picModelForIndex:(NSInteger)index{
    return self.picList[index];
}
- (NSURL *)picURLForIndex:(NSInteger)index{
    return [self picModelForIndex:index].url.cc_URL;
}
- (void)getPicGalleryId:(NSString *)galleryId completionHandler:(void (^)(NSError *))completionHandler{
    [DWNetManager getDWPicGalleryId:galleryId completionHandler:^(DWPicModel *model, NSError *error) {
        self.picList = model.pictures;
        completionHandler(error);
    }];
}
- (NSArray *)picList{
    if (!_picList) {
        _picList = [NSArray new];
    }
    return _picList;
}






@end






