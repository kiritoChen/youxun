//
//  TuWanViewModel.m
//  CCBasicProject
//
//  Created by chenc on 16/6/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "TuWanViewModel.h"
#import "NetManager.h"
@implementation TuWanViewModel
// 初始化
- (instancetype)initWithType:(TWDataRequestModel)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

- (NSURL *)htmlForRow:(NSInteger)row{
    return [self modelForRow:row].html5.cc_URL;
}
- (NSInteger)numForRow{
    return self.dataList.count;
}
- (NSURL *)iconForRow:(NSInteger)row{
    return [self modelForRow:row].litpic.cc_URL;
}
- (NSString *)titleForRow:(NSInteger)row{
    NSLog(@"%@", [self modelForRow:row].title);//
    return [self modelForRow:row].title;
}
- (NSString *)detailForRow:(NSInteger)row{
    return [self modelForRow:row].desc;
}
- (NSString *)clickForRow:(NSInteger)row{
    NSString *click = [NSString stringWithFormat:@"%@人浏览", [self modelForRow:row].click];
    return click;
}
- (TuWanDataListModel *)modelForRow:(NSInteger)row{
    return self.dataList[row];
}

- (NSArray<ListShowitemModel *> *)showItemsIconForRow:(NSInteger)row{
    NSMutableArray *picList = [NSMutableArray new];
    NSArray *showitems = [self modelForRow:row].showItem;
    for (int i =0; i < showitems.count; i++) {
        ListShowitemModel *model = showitems[i];
        NSURL *url = [NSURL URLWithString:model.pic];
        [picList addObject:url];
    }
    return [picList copy];
}
// 是一张图的风格为YES，三张图的为NO.
- (bool)isOnePicStyleForRow:(NSInteger)row{
    return [[self modelForRow:row].showType isEqualToString:@"0"];
}

- (void)getDataRequestModel:(VMDataRequestModel)request CompletionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpStart = 0;
    switch (request) {
        case VMDataRequestModelRefresh: {
            tmpStart = 0;
            break;
        }
        case VMDataRequestModelMore: {
            tmpStart = _page + 11;
            break;
        }
    }
    [NetManager getDataRequestModel:_type startNum:tmpStart completionHandler:^(TuWanModel *model, NSError *error) {
        if (!error) {
            if (request == VMDataRequestModelRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.data.list];
            self.topList = model.data.indexpic;
            _page = tmpStart;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
- (NSMutableArray<TuWanDataListModel *> *)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}
// 头部视图
- (NSArray<TuWanDataIndexpicModel *> *)topList{
    if (!_topList) {
        _topList = [NSArray new];
    }
    return _topList;
}
- (TuWanDataIndexpicModel *)topModelForIndex:(NSInteger)index{
    return self.topList[index];
}
- (NSInteger)topNumber{
    return self.topList.count;
}
- (NSString *)topTitleForIndex:(NSInteger)index{
    return [self topModelForIndex:index].title;
}
- (NSURL *)topIconURLForIndex:(NSInteger)index{
    return [self topModelForIndex:index].litpic.cc_URL;
}
- (BOOL)isHasTop{
    return self.topList.count != 0;
}

- (NSString *)aidForRow:(NSInteger)row{
    return [self modelForRow:row].aid;
}
- (TWContentType)contentTypeForRow:(NSInteger)row{
    NSString *typeName = [self modelForRow:row].type;
    if ([typeName isEqualToString:@"all"]) {
        return TWContentTypeAll;
    }else if ([typeName isEqualToString:@"pic"]){
        return TWContentTypePic;
    }else{
        return TWContentTypeVideo;
    }
}

@end







