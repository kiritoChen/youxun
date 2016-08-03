//
//  NetManager.m
//  BasicProject
//
//  Created by chenc on 16/6/29.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
// 获取图片资源
+ (void)getPic:(NSString *)aid completionHandler:(void (^)(CCPicModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?aid=%@&appid=1", aid];
    [self GET:path parameters:nil downloadProgress:nil completionHandler:^(id jsonObj, NSError *error) {
        NSArray *tmpArr = [CCPicModel parseJSON:jsonObj];
        !completionHandler ?: completionHandler(tmpArr.firstObject, error);
    }];
}

+ (void)getVideo:(NSString *)aid completionHandler:(void (^)(CCVideoModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:@"http://cache.tuwan.com/app/?aid=%@&appid=1", aid];
    [self GET:path parameters:nil downloadProgress:nil completionHandler:^(id jsonObj, NSError *error) {
        NSArray *tmpArr = [CCVideoModel parseJSON:jsonObj];
        !completionHandler ?: completionHandler(tmpArr.firstObject, error);
    }];
}


+ (void)getDataRequestModel:(TWDataRequestModel)requestModel startNum:(NSInteger)startNum completionHandler:(void (^)(TuWanModel *, NSError *))completionHandler{
    NSString *path = nil;
    switch (requestModel) {
        case TWDataRequestModelTouTiao: {
            path = [NSString stringWithFormat:kTouTiaoPath, startNum];
            break;
        }
        case TWDataRequestModelDuJia: {
            NSString *chinese = [@"八卦" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            path = [NSString stringWithFormat:kDuJiaPath, chinese, startNum];
            break;
        }
        case TWDataRequestModelAnHei: {
            path = [NSString stringWithFormat:kAnHeiPath, startNum];
            break;
        }
        case TWDataRequestModelMoShou: {
            path = [NSString stringWithFormat:kMoShouPath, startNum];
            break;
        }
        case TWDataRequestModelFengBao: {
            path = [NSString stringWithFormat:kFengBaoPath, startNum];
            break;
        }
        case TWDataRequestModelLuShi: {
            path = [NSString stringWithFormat:kLuShiPath, startNum];
            break;
        }
        case TWDataRequestModelXinJi: {
            path = [NSString stringWithFormat:kXinJiPath, startNum];
            break;
        }
        case TWDataRequestModelShouWang: {
            path = [NSString stringWithFormat:kShouWangPath, startNum];
            break;
        }
        case TWDataRequestModelTuPian: {
            path = [NSString stringWithFormat:kTuPianPath, startNum];
            break;
        }
        case TWDataRequestModelShiPin: {
            path = [NSString stringWithFormat:kShiPinPath, startNum];
            break;
        }
        case TWDataRequestModelGongLue: {
            path = [NSString stringWithFormat:kGongLuePath, startNum];
            break;
        }
        case TWDataRequestModelHuanHua: {
            NSString *chinese = [@"幻化" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            path = [NSString stringWithFormat:kHuanHuaPath,chinese, startNum];
            break;
        }
        case TWDataRequestModelQuWen: {
            NSString *chinese = [@"趣闻" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            path = [NSString stringWithFormat:kQuWenPath,chinese, startNum];
            break;
        }
        case TWDataRequestModelCOS: {
            path = [NSString stringWithFormat:kCOSPath, startNum];
            break;
        }
        case TWDataRequestModelMeiNv: {
            NSString *chinese = [@"美女" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            path = [NSString stringWithFormat:kMeiNvPath,chinese, startNum];
            break;
        }
    }
    NSLog(@"%@", path);// 测试
    [self GET:path parameters:nil downloadProgress:nil completionHandler:^(id jsonObj, NSError *error) {
        !completionHandler ?: completionHandler([TuWanModel parseJSON:jsonObj], error);
    }];
}











@end












