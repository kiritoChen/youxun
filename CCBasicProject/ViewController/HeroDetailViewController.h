//
//  HeroDetailViewController.h
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroDetailViewController : UITableViewController
- (instancetype)initWithStyle:(UITableViewStyle)style iconImageURL:(NSURL *)iconURL enName:(NSString *)enName;
@property (nonatomic) NSURL *iconURL;
@property (nonatomic) NSString *enName;

@end
