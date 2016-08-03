//
//  TuWanModel.m
//  BasicProject
//
//  Created by chenc on 16/6/29.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "TuWanModel.h"

@implementation TuWanModel

@end

@implementation TuWanDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"indexpic": [TuWanDataIndexpicModel class],
             @"list": [TuWanDataListModel class]};
}
@end
// indexpic------------------------------------------------------------
@implementation TuWanDataIndexpicModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName": @"typename",
             @"showType": @"showtype",
             @"typeChild": @"typechild",
             @"longTitle": @"longtitle",
             @"touTiao": @"toutiao",
             @"infoChild": @"infochild",
             @"showItem": @"showitem",
             @"pubDate": @"pubdate",
             @"timeStamp": @"timestamp",
             @"desc": @"description"};
}
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"showItem": [IndexpicShowitemModel class]};
}
@end

@implementation IndexpicInfochildModel
@end

@implementation IndexpicShowitemModel
@end

@implementation IndexpicShowitemInfoModel
@end
// list ------------------------------------------------------------
@implementation TuWanDataListModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName": @"typename",
             @"showType": @"showtype",
             @"typeChild": @"typechild",
             @"longTitle": @"longtitle",
             @"touTiao": @"toutiao",
             @"infoChild": @"infochild",
             @"showItem": @"showitem",
             @"pubDate": @"pubdate",
             @"timeStamp": @"timestamp",
             @"desc": @"description"};
}
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"showItem": [ListShowitemModel class]};
}
@end

@implementation ListInfochildModel
@end

@implementation ListShowitemModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"width": @"info.width",
             @"height": @"info.height"};
}
@end


