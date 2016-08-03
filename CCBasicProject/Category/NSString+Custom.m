//
//  NSString+Custom.m
//  BasicProject
//
//  Created by chenc on 16/6/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "NSString+Custom.h"

@implementation NSString (Custom)
- (NSURL *)cc_URL{
    return [NSURL URLWithString:self];
}
@end
