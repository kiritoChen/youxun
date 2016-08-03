//
//  PhotoViewController.h
//  CCBasicProject
//
//  Created by chenc on 16/7/26.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWViewModel.h"

@interface PhotoViewController : UIViewController
- (instancetype)initWithRequestMode:(DWRequestMode)mode;
@property (nonatomic) DWRequestMode mode;
@end
