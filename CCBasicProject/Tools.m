//
//  Tools.m
//  CCBasicProject
//
//  Created by chenc on 16/7/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "Tools.h"

@implementation Tools
// 获取缓存数据大小
+ (NSString *)getCacheSize{
    // 缓存大小
    long long sumSize = 0;
    // 获取缓存路径
    NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/default/com.hackemist.SDWebImageCache.default"];
    //    NSLog(@"缓存的路径 filePath %@", cacheFilePath);
    // 创建文件管理对象
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 获取当前缓存路径下的所有子路径
    NSArray *subChildPath = [fileManager subpathsOfDirectoryAtPath:cacheFilePath error:nil];
    // 遍历所有子文件夹
    for (NSString *subPath in subChildPath) {
        // 拼接完整路径
        NSString *path = [cacheFilePath stringByAppendingFormat:@"/%@", subPath];
        // 计算文件大小
        long long fileSize = [[fileManager attributesOfItemAtPath:path error:nil] fileSize];
        // 加到总文件大小
        sumSize += fileSize;
    }
    float size_m = sumSize / (1024 * 1024);
    return [NSString stringWithFormat:@"%.2fM", size_m];
}

// 删除缓存数据
+ (void)removeCacheData{
    NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/default/com.hackemist.SDWebImageCache.default"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:cacheFilePath error:nil];
    return;
}

+ (BOOL)isPhoneNumber:(NSString *)number{
    return number.length == 11 && number.doubleValue > 10000000000;
}



@end
