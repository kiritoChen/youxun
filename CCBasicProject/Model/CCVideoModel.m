//
//  CCVideoModel.m
//  CCBasicProject
//
//  Created by chenc on 16/6/30.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "CCVideoModel.h"

@implementation CCVideoModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"relevant": [CCVideoRelevantModel class],
             @"content": [CCVideoContentModel class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"showType": @"showtype",
             @"typeChild": @"typechild",
             @"longTitle": @"longtitle",
             @"typeName": @"typename",
             @"touTiao": @"toutiao",
             @"litPic": @"litpic",
             @"pubDate": @"pubdate",
             @"timeStamp": @"timestamp",
             @"desc": @"description",};
}

@end


@implementation CCVideoContentModel

@end


@implementation CCVideoRelevantModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"desc": @"description",
             @"litPic": @"litpic",
             @"pubDate": @"pubdate",
             @"typeName": @"typename",
             @"timeStamp": @"timestamp",
             @"typeChild": @"typechild",
             @"longTitle": @"longtitle",};
}


@end











