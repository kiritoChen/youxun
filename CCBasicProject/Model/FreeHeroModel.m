//
//  FreeHeroModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "FreeHeroModel.h"

@implementation FreeHeroModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"free": [FreeHeroFreeModel class]};
}
@end
@implementation FreeHeroFreeModel

@end


