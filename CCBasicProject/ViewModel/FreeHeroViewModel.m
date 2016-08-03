//
//  FreeHeroViewModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "FreeHeroViewModel.h"

@implementation FreeHeroViewModel

- (void)getDataListCompletionHandler:(void (^)(NSError *))completionHandler{
    [SettingNetManager getFreeHeroListCompletionHandler:^(FreeHeroModel *model, NSError *error) {
        self.freeHeroList = model.free;
        self.desc = model.desc;
        completionHandler(error);
    }];
}

- (NSInteger)numberOfCell{
    return self.freeHeroList.count;
}

- (FreeHeroFreeModel *)modelForCell:(NSInteger)index{
    return self.freeHeroList[index];
}

- (NSURL *)iconForCell:(NSInteger)index{
    NSString *path = [NSString stringWithFormat:kHeroIconPath, [self modelForCell:index].enName];
    return path.cc_URL;
}
- (NSString *)enNameForCell:(NSInteger)index{
    return [self modelForCell:index].enName;
}
- (NSString *)cnNameForCell:(NSInteger)index{
    return [self modelForCell:index].cnName;
}

- (NSString *)titleForCell:(NSInteger)index{
    return [self modelForCell:index].title;
}

- (NSString *)locationForCell:(NSInteger)index{
    return [self modelForCell:index].location;
}

- (NSArray<FreeHeroFreeModel *> *)freeHeroList{
    if (!_freeHeroList) {
        _freeHeroList = [NSArray new];
    }
    return _freeHeroList;
}


@end
