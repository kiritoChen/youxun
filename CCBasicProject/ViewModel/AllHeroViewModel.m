//
//  AllHeroViewModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "AllHeroViewModel.h"

@implementation AllHeroViewModel
- (void)getAllHeroDataListCompletionHandler:(void(^)(NSError *error))completionHandler{
    [SettingNetManager getHeroDataListCompletionHandler:^(AllHeroModel *model, NSError *error) {
        self.heroList = model.all;
        completionHandler(error);
    }];
}
- (NSArray *)heroList{
    if (!_heroList) {
        _heroList = [NSArray new];
    }
    return _heroList;
}
- (NSInteger)numberOfIndex{
    return self.heroList.count;
}
- (AllHeroListModel *)modelForIndex:(NSInteger)Index{
    return self.heroList[Index];
}
- (NSURL *)iconForIndex:(NSInteger)index{
    NSString *iconPath = [NSString stringWithFormat:kHeroIconPath, [self modelForIndex:index].enName];
    return iconPath.cc_URL;
}
- (NSString *)cnNameForIndex:(NSInteger)index{
    return [self modelForIndex:index].cnName;
}
- (NSString *)enNameForIndex:(NSInteger)index{
    return [self modelForIndex:index].enName;
}
// 每个英雄详情
//- (void)getHeroDetailWithenName:(NSString *)enName CompletionHandler:(void (^)(NSError *))completionHandler{
//    [SettingNetManager getHeroDetailWithenName:enName CompletionHandler:^(HeroDetailModel *model, NSError *error) {
//        
//    }];
//}


@end


















