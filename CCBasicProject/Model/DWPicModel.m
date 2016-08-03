//
//  DWPicModel.m
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "DWPicModel.h"

@implementation DWPicModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"desc": @"description"};
}
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"pictures": [DWPicPicturesModel class]};
}
@end
@implementation DWPicPicturesModel

@end


