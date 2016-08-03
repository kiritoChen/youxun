//
//  TWTableViewController.h
//  CCBasicProject
//
//  Created by chenc on 16/6/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuWanViewModel.h"

@interface TWTableViewController : UITableViewController
- (instancetype)initWithStyle:(UITableViewStyle)style requestType:(TWDataRequestModel)type;
@property (nonatomic, readonly) TWDataRequestModel requestType;;
@end
