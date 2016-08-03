//
//  SettingNetManager.h
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllHeroModel.h"
#import "HeroDetailModel.h"
#import "FreeHeroModel.h"

@interface SettingNetManager : NSObject
+ (void)getHeroDataListCompletionHandler:(void(^)(AllHeroModel *model, NSError *error))completionHandler;
// 获取英雄详情
+ (void)getHeroDetailWithenName:(NSString *)enName CompletionHandler:(void(^)(HeroDetailModel *model, NSError *error))completionHandler;

// 周免
+ (void)getFreeHeroListCompletionHandler:(void(^)(FreeHeroModel *model, NSError *error))completionHandler;

@end
