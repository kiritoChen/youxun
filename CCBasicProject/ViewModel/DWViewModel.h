//
//  DWViewModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/26.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicViewModel.h"
#import "DWNetManager.h"

@interface DWViewModel : BasicViewModel
// 初始化资讯的类型
- (instancetype)initNewsType:(DWRequestMode)type;
@property (nonatomic, readonly) DWRequestMode type;
@property (nonatomic) NSInteger page;


@property (nonatomic) NSInteger numberForRow;
- (DWNewsDataModel *)modelForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSURL *)srcPhotoForRow:(NSInteger)row;
- (NSString *)readCountForRow:(NSInteger)row;
- (NSString *)contentForRow:(NSInteger)row;
- (NSURL *)artIdForRow:(NSInteger)row;

// 图片----begain
@property (nonatomic) NSInteger numberForIndex;
- (NSString *)havePicSumForIndex:(NSInteger)index;
- (NSURL *)coverForIndex:(NSInteger)index;
- (CGSize)coverSizeForIndex:(NSInteger)index;
- (NSString *)commentCountForIndex:(NSInteger)index;
- (DWNewsDataModel *)modelForIndex:(NSInteger)index;
- (NSString *)titleForIndex:(NSInteger)index;
- (NSString *)galleryIdForIndex:(NSInteger)index;
// 图片----end

@property (nonatomic) NSMutableArray<DWNewsDataModel *> *dataList;
// 图片浏览的时候的数据
@property (nonatomic) NSInteger picSum;
- (void)getPicGalleryId:(NSString *)galleryId completionHandler:(void (^)(NSError *error))completionHandler;
- (NSURL *)picURLForIndex:(NSInteger)index;
- (DWPicPicturesModel *)picModelForIndex:(NSInteger)index;
@property (nonatomic) NSArray *picList;

@end










