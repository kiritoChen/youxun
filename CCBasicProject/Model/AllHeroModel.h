//
//  AllHeroModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>


@class AllHeroListModel;
@interface AllHeroModel : NSObject
@property (nonatomic, strong) NSArray<AllHeroListModel *> *all;
@end

@interface AllHeroListModel : NSObject
@property (nonatomic, copy) NSString *enName;
@property (nonatomic, copy) NSString *cnName;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *tags;
@end

