//
//  NSObject+ParseJSON.m
//  BasicProject
//
//  Created by chenc on 16/6/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "NSObject+ParseJSON.h"

@implementation NSObject (ParseJSON)
+ (instancetype)parseJSON:(id)json{
    if ([json isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:json];
    }
    if ([json isKindOfClass:[NSDictionary class]]) {
        return [self modelWithJSON:json];
    }
    return json;
}
@end
