//
//  CCVideoViewController.h
//  CCBasicProject
//
//  Created by chenc on 16/7/1.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCVideoViewController : UIViewController

- (instancetype)initWithAid:(NSString *)aid;
@property (nonatomic, readonly) NSString *aid;

@end
