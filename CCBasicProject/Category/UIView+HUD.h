//
//  UIView+HUD.h
//  BasicProject
//
//  Created by chenc on 16/6/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUD)
//忙提示
- (void)showBusyHUD;
//文字提示
- (void)showWarning:(NSString *)warning;
//隐藏提示
- (void)hideBusyHUD;
@end
