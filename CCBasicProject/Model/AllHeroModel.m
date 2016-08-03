//
//  AllHeroModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "AllHeroModel.h"

@implementation AllHeroModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"all": [AllHeroListModel class]};
}
@end

@implementation AllHeroListModel

@end

