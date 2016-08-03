//
//  NetManager.h
//  BasicProject
//
//  Created by chenc on 16/6/29.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TuWanModel.h"
#import "CCPicModel.h"
#import "CCVideoModel.h"

typedef NS_ENUM(NSUInteger, TWDataRequestModel) {
    TWDataRequestModelTouTiao,//头条
    TWDataRequestModelDuJia,//独家
    TWDataRequestModelAnHei,//暗黑
    TWDataRequestModelMoShou,//魔兽
    TWDataRequestModelFengBao,//风暴
    TWDataRequestModelLuShi,//炉石
    TWDataRequestModelXinJi,//星际
    TWDataRequestModelShouWang,//守望先锋
    TWDataRequestModelTuPian,//图片
    TWDataRequestModelShiPin,//视频
    TWDataRequestModelGongLue,//攻略
    TWDataRequestModelHuanHua,//幻化
    TWDataRequestModelQuWen,//趣闻
    TWDataRequestModelCOS,//COS
    TWDataRequestModelMeiNv,//美女
};

@interface NetManager : NSObject
+ (void)getDataRequestModel:(TWDataRequestModel)requestModel startNum:(NSInteger)startNum completionHandler:(void(^)(TuWanModel *model, NSError *error))completionHandler;
// 获取图片资源
+ (void)getPic:(NSString *)aid completionHandler:(void(^)(CCPicModel * model, NSError *error))completionHandler;
// 获取视频资源
+ (void)getVideo:(NSString *)aid completionHandler:(void(^)(CCVideoModel * model, NSError *error))completionHandler;
@end





