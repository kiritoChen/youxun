//
//  DWNetManager.m
//  CCBasicProject
//
//  Created by chenc on 16/7/26.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "DWNetManager.h"

@implementation DWNetManager

+ (void)getDWDataPage:(NSInteger)page requestMode:(DWRequestMode)requestMode completionHandler:(void (^)(id, NSError *))completionHandler{
    NSString *path = nil;
    switch (requestMode) {
        case DWRequestModeTouTiao: {
            path = kDWTouTiao;
            break;
        }
        case DWRequestModeShiPing: {
            path = kDWShiPing;
            break;
        }
        case DWRequestModeSaiShi: {
            path = kDWSaiShi;
            break;
        }
        case DWRequestModeLiangZhao: {
            path = kDWLiangZhao;
            break;
        }
        case DWRequestModeJionTu: {
            path = kDWJionTu;
            break;
        }
        case DWRequestModeBiZhi: {
            path = kDWBiZhi;
            break;
        }
    }
    path = [NSString stringWithFormat:path, page];
    [self GET:path parameters:nil downloadProgress:nil completionHandler:^(id jsonObj, NSError *error) {
            !completionHandler ?: completionHandler([DWNewsModel parseJSON:jsonObj], error);
        
        
    }];
}

+ (void)getDWPicGalleryId:(NSString *)galleryId completionHandler:(void (^)(DWPicModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kPhotosPath, galleryId];
    [self GET:path parameters:nil downloadProgress:nil completionHandler:^(id jsonObj, NSError *error) {
        !completionHandler ?: completionHandler([DWPicModel parseJSON:jsonObj], error);
    }];
}

@end
