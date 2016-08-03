//
//  TuWanViewModel.h
//  CCBasicProject
//
//  Created by chenc on 16/6/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicViewModel.h"
#import "TuWanModel.h"
#import "NetManager.h"

typedef NS_ENUM(NSUInteger, TWContentType) {
    TWContentTypeAll,
    TWContentTypePic,
    TWContentTypeVideo,
};

@interface TuWanViewModel : BasicViewModel
// 初始化新闻类型
- (instancetype)initWithType:(TWDataRequestModel)type;
@property (nonatomic, readonly) TWDataRequestModel type;
// 分页加载
@property (nonatomic) NSInteger page;
// UI
@property (nonatomic) NSInteger numForRow;
- (NSURL *)iconForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)detailForRow:(NSInteger)row;
- (NSString *)clickForRow:(NSInteger)row;
- (NSURL *)htmlForRow:(NSInteger)row;
- (TuWanDataListModel *)modelForRow:(NSInteger)row;

- (NSArray<ListShowitemModel *> *)showItemsIconForRow:(NSInteger)row;
@property (nonatomic) NSMutableArray<TuWanDataListModel *> *dataList;
// 是一张图的风格为YES，三张图的为NO.
- (bool)isOnePicStyleForRow:(NSInteger)row;

/* 头部滚动视图 */
// 滚动图片的数量
@property (nonatomic) NSArray<TuWanDataIndexpicModel *> *topList;
@property (nonatomic) NSInteger topNumber;
- (NSURL *)topIconURLForIndex:(NSInteger)index;
- (NSString *)topTitleForIndex:(NSInteger)index;
// 是否有头部
@property (nonatomic, getter=isHasTop) BOOL hasTop;

// 图片浏览
- (NSString *)aidForRow:(NSInteger)row;
- (TWContentType)contentTypeForRow:(NSInteger)row;

@end







