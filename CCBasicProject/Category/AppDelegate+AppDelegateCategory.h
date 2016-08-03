//
//  AppDelegate+AppDelegateCategory.h
//  BasicProject
//
//  Created by chenc on 16/6/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppDelegateCategory)
- (void)addCustomGlobalConfig;
@property(nonatomic,readonly,getter=isOnLine)BOOL onLine;
@end
