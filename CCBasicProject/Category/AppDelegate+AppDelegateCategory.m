//
//  AppDelegate+AppDelegateCategory.m
//  BasicProject
//
//  Created by chenc on 16/6/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "AppDelegate+AppDelegateCategory.h"
#import "EMSDK.h"

@implementation AppDelegate (AppDelegateCategory)
- (void)addCustomGlobalConfig{
    //    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    //当使用`AF`发送网络请求时,在状态栏有菊花提示
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"此时的网络状态Reachability:%@",AFStringFromNetworkReachabilityStatus(status));
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    //push导航滑动问题
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypePan];
    
    //启动友盟统计 后续完善。。。。。
    
    
    //启动友盟统计 后续完善。。。。。
}
- (BOOL)isOnLine{
    /*
     //    AFNetworkReachabilityStatus status = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
     //    //手机网络或者WIFI都属于在线状态
     //    return status == AFNetworkReachabilityStatusReachableViaWiFi || status == AFNetworkReachabilityStatusReachableViaWWAN;
     */
    
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN || [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[EMClient sharedClient] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
