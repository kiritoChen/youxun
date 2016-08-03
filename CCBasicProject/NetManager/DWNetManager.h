//
//  DWNetManager.h
//  CCBasicProject
//
//  Created by chenc on 16/7/26.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DWNewsModel.h"
#import "DWPicModel.h"

typedef NS_ENUM(NSUInteger, DWRequestMode) {
    DWRequestModeTouTiao,
    DWRequestModeShiPing,
    DWRequestModeSaiShi,
    DWRequestModeLiangZhao,
    DWRequestModeJionTu,
    DWRequestModeBiZhi,
};

@interface DWNetManager : NSObject

+ (void)getDWDataPage:(NSInteger)page requestMode:(DWRequestMode)requestMode completionHandler:(void(^)(id model, NSError *error))completionHandler;
+ (void)getDWPicGalleryId:(NSString *)galleryId completionHandler:(void(^)(DWPicModel *model, NSError *error))completionHandler;
@end
