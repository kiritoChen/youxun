//
//  FreeHeroModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FreeHeroFreeModel;
@interface FreeHeroModel : NSObject
@property (nonatomic, strong) NSArray<FreeHeroFreeModel *> *free;
@property (nonatomic, copy) NSString *desc;
@end

@interface FreeHeroFreeModel : NSObject
@property (nonatomic, copy) NSString *enName;
@property (nonatomic, copy) NSString *cnName;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *tags;
@end

