//
//  FreeHeroViewModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingNetManager.h"

@interface FreeHeroViewModel : NSObject
- (void)getDataListCompletionHandler:(void(^)(NSError *error))completionHandler;
@property (nonatomic) NSArray<FreeHeroFreeModel *> *freeHeroList;
@property (nonatomic) NSString *desc;

@property (nonatomic) NSInteger numberOfCell;
- (FreeHeroFreeModel *)modelForCell:(NSInteger)index;
- (NSURL *)iconForCell:(NSInteger)index;
- (NSString *)cnNameForCell:(NSInteger)index;
- (NSString *)titleForCell:(NSInteger)index;
- (NSString *)locationForCell:(NSInteger)index;
- (NSString *)enNameForCell:(NSInteger)index;

@end
