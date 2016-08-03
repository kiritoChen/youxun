//
//  DWNewsModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/26.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "DWNewsModel.h"

@implementation DWNewsModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data": [DWNewsDataModel class],
             @"headerline": [DWNewsDataHeaderLineModel class]};
}
@end

@implementation DWNewsDataModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id",
             @"ymzId": @"ymz_id",
             @"commentId": @"comment_id",
             @"desc": @"description",
             @"modifyTime": @"modify_time"};
}
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"videoList": [DWNewsDataVideoListModel class]};
}
@end


@implementation DWNewsDataVideoListModel

@end


@implementation DWNewsDataHeaderLineModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID": @"id"};
}
@end


