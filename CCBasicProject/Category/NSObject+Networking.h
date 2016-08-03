//
//  NSObject+Networking.h
//  BasicProject
//
//  Created by chenc on 16/6/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Networking)
+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters downloadProgress:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:(void(^)(id jsonObj, NSError *error))completionHandler;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters downloadProgress:(void(^)(NSProgress *downloadProgress))downloadProgress completionHandler:(void(^)(id jsonObj, NSError *error))completionHandler;

////解析时候转中文
- (NSString*)stringFromChineseToPercent:(NSString *)ChineseString;
@end
