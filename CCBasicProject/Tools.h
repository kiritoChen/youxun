//
//  Tools.h
//  CCBasicProject
//
//  Created by chenc on 16/7/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject
// 获取缓存数据
+ (NSString *)getCacheSize;
// 删除缓存数据
+ (void)removeCacheData;
// 判断手机号码
+ (BOOL)isPhoneNumber:(NSString *)number;


@end
