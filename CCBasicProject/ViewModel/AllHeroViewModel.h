//
//  AllHeroViewModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingNetManager.h"

@interface AllHeroViewModel : NSObject
// 展示131个英雄的列表
- (void)getAllHeroDataListCompletionHandler:(void(^)(NSError *error))completionHandler;
@property (nonatomic) NSArray *heroList;
@property (nonatomic) NSInteger numberOfIndex;
- (AllHeroListModel *)modelForIndex:(NSInteger)Index;
- (NSURL *)iconForIndex:(NSInteger)index;
- (NSString *)cnNameForIndex:(NSInteger)index;
- (NSString *)enNameForIndex:(NSInteger)index;
// 每个英雄的详情
//- (void)getHeroDetailWithenName:(NSString *)enName CompletionHandler:(void(^)(NSError *error))completionHandler;
@end
