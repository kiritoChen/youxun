//
//  BasicViewModel.h
//  CCBasicProject
//
//  Created by chenc on 16/6/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, VMDataRequestModel) {
    VMDataRequestModelRefresh,
    VMDataRequestModelMore,
};

@interface BasicViewModel : NSObject{
    NSURLSessionDataTask *_dataTask;
}

- (void)getDataRequestModel:(VMDataRequestModel)request CompletionHandler:(void(^)(NSError *error))completionHandler;

@end
