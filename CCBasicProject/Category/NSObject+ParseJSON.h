//
//  NSObject+ParseJSON.h
//  BasicProject
//
//  Created by chenc on 16/6/24.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NSObject+YYModel.h>

@interface NSObject (ParseJSON)<YYModel>
+ (instancetype)parseJSON:(id)json;
@end
