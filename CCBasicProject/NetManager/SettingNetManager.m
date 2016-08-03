//
//  SettingNetManager.m
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "SettingNetManager.h"

@implementation SettingNetManager
+ (void)getHeroDataListCompletionHandler:(void (^)(AllHeroModel *, NSError *))completionHandler{
    [self GET:kAllHeroPath parameters:nil downloadProgress:nil completionHandler:^(id jsonObj, NSError *error) {
        !completionHandler ?: completionHandler([AllHeroModel parseJSON:jsonObj], error);
    }];
}
+ (void)getFreeHeroListCompletionHandler:(void (^)(FreeHeroModel *, NSError *))completionHandler{
    [self GET:kFreeHeroPath parameters:nil downloadProgress:nil completionHandler:^(id jsonObj, NSError *error) {
        !completionHandler ?: completionHandler([FreeHeroModel parseJSON:jsonObj], error);
    }];
}
+ (void)getHeroDetailWithenName:(NSString *)enName CompletionHandler:(void (^)(HeroDetailModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kHeroDetailPath, enName];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:path.cc_URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSMutableDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableDictionary *dic = jsonObj;
        [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            key = [key stringByReplacingOccurrencesOfString:enName withString:@"Hero"];
            [dic setObject:obj forKey:key];
        }];
        !completionHandler ?: completionHandler([HeroDetailModel parseJSON:jsonObj], error);
    }];
    [dataTask resume];
}
@end
