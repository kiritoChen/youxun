//
//  AppDelegate.m
//  CCBasicProject
//
//  Created by chenc on 16/6/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "AppDelegate.h"
#import "TWPageViewController.h"
#import "DWPageViewController.h"
#import <UMMobClick/MobClick.h>
#import "HeroDetailViewController.h"
#import "PageViewController.h"
#import "PersonalViewController.h"
#import "EMSDK.h"
#import <SMS_SDK/SMSSDK.h>

#define kMobAppKey @"14b46927b817c"
#define kMobSecret @"566045dacc4c2ec18c4065edc08a7be2"
#define kHuanXinAppKey @"kiritochen#gamenewsforchencheng"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self addCustomGlobalConfig];
    UMConfigInstance.appKey = kUMengAPPKey;
    UMConfigInstance.channelId = @"App Store";
    // 环信
    EMOptions *options = [EMOptions optionsWithAppkey:kHuanXinAppKey];
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    // mob短信认证
    [SMSSDK registerApp:kMobAppKey withSecret:kMobSecret];
    
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:[TWPageViewController new]];
    UINavigationController *naVC1 = [[UINavigationController alloc] initWithRootViewController:[DWPageViewController new]];
    UINavigationController *naVC2 = [[UINavigationController alloc] initWithRootViewController:[PageViewController new]];
    PersonalViewController *personVC = [[PersonalViewController alloc] init];
    UINavigationController *naVC3 = [[UINavigationController alloc] initWithRootViewController:personVC];
    [UINavigationBar appearance].barTintColor = kBGColor;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    
    UITabBarController *tabbarVC = [[UITabBarController alloc] init];
    NSLog(@"");
    [UITabBar appearance].tintColor = kBGColor;
    [UITabBar appearance].translucent = NO;
    tabbarVC.viewControllers = @[naVC, naVC1, naVC2, naVC3];
    _window.rootViewController = tabbarVC;
    return YES;
}


@end
