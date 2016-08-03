//
//  HeroDetailViewModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingNetManager.h"

@interface HeroDetailViewModel : NSObject

- (void)getHeroDetailWithHeroName:(NSString *)enName completionHandler:(void(^)(NSError *error))completionHandler;
@property (nonatomic) HeroDetailModel *detailModel;
@property (nonatomic) NSString *cnName;
@property (nonatomic) NSString *price;
@property (nonatomic) NSString *attribute;


@property (nonatomic) NSArray *skillDescriptions;
@property (nonatomic) NSArray *skillNames;
@property (nonatomic) NSArray *skillFullNames;
@end
