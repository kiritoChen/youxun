//
//  CCPicModel.m
//  CCBasicProject
//
//  Created by chenc on 16/6/30.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "CCPicModel.h"

@implementation CCPicModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"showitem": [CCPicShowitemModel class],
             @"relevant": [CCPicRelevantModel class],
             @"content": [CCPicShowitemModel class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName": @"typename",
             @"desc": @"description",
             @"later": @"infochild.later",
             @"cn": @"infochild.cn",
             @"facial": @"infochild.facial",
             @"feature": @"infochild.feature",
             @"role": @"infochild.role",
             @"shoot": @"infochild.shoot",
             };
}

@end

@implementation CCPicShowitemModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"width": @"info.width",
             @"height": @"info.height"};
}
@end


@implementation CCPicRelevantModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"desc": @"description",
             @"typeName": @"typename"};
}
@end

