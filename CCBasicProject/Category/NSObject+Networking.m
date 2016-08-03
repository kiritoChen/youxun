//
//  NSObject+Networking.m
//  BasicProject
//
//  Created by chenc on 16/6/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "NSObject+Networking.h"

@implementation NSObject (Networking)
+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters downloadProgress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id, NSError *))completionHandler{
    //做测试不行  但是 程序运行之后可以打开的
    //判断当前网络状态
    /*
     if (kAppdelegate.onLine==NO) {
     MBProgressHUD *hub=[MBProgressHUD showHUDAddedTo:kAppdelegate.window animated:YES];
     hub.mode=MBProgressHUDModeText;
     hub.labelText=@"无网络，请稍后再试";
     //设置弹出时间
     [hub hide:YES afterDelay:1];
     NSError *error=[NSError errorWithDomain:path code:1234 userInfo:@{NSLocalizedDescriptionKey:@"无网络"}];//code后面是暗号  userInfo:后面是固定的  userInfo中的key的值，会自动存入error的localizedDescription属性中
     //error.localizedDescription
     completionHandler(nil,error);
     return nil;
     }
     */
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/json", @"text/plain", @"application/json", @"text/javascript", nil];
    return [manager GET:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        !completionHandler ?: completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:kAppdelegate.window animated:YES];
            hub.mode = MBProgressHUDModeText;
            hub.labelText = @"无网络，请稍后重试";
            // 设置弹窗显示时间
            [hub hide:YES afterDelay:1.5];
        }
        !completionHandler ?: completionHandler(nil, error);
    }];
}

+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters downloadProgress:(void (^)(NSProgress *))downloadProgress completionHandler:(void (^)(id, NSError *))completionHandler{
    /*
     //判断当前网络状态
     if (kAppdelegate.onLine==NO) {
     MBProgressHUD *hub=[MBProgressHUD showHUDAddedTo:kAppdelegate.window animated:YES];
     hub.mode=MBProgressHUDModeText;
     hub.labelText=@"无网络，请稍后再试";
     //设置弹出时间
     [hub hide:YES afterDelay:1];
     NSError *error=[NSError errorWithDomain:path code:1234 userInfo:@{NSLocalizedDescriptionKey:@"无网络"}];//code后面是暗号  userInfo:后面是固定的  userInfo中的key的值，会自动存入error的localizedDescription属性中
     //error.localizedDescription
     completionHandler(nil,error);
     return nil;
     }
     */
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 30;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"text/json", @"text/plain", @"application/json", @"text/javascript", nil];
    return [manager POST:path parameters:parameters progress:downloadProgress success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        !completionHandler ?: completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            MBProgressHUD *hub=[MBProgressHUD showHUDAddedTo:kAppdelegate.window animated:YES];
            hub.mode=MBProgressHUDModeText;
            hub.labelText=@"无网络，请稍后再试";
            //设置弹出时间
            [hub hide:YES afterDelay:1];
            
        }
        !completionHandler ?: completionHandler(nil, error);
    }];
}

- (NSString *)stringFromChineseToPercent:(NSString *)ChineseString{
    //    return [ChineseString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //点击进去之后  可以看到了最新的
    return [ChineseString stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
}




@end
