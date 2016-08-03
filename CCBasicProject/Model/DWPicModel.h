//
//  DWPicModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DWPicPicturesModel;
@interface DWPicModel : NSObject
@property (nonatomic, copy) NSString *picsum;
@property (nonatomic, copy) NSString *clicks;
@property (nonatomic, copy) NSString *updated;
@property (nonatomic, copy) NSString *commentCount;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray<DWPicPicturesModel *> *pictures;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *galleryId;
@end

@interface DWPicPicturesModel : NSObject
@property (nonatomic, copy) NSString *fileHeight;
@property (nonatomic, copy) NSString *old;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *picId;
@property (nonatomic, copy) NSString *coverUrl;
@property (nonatomic, copy) NSString *picDesc;
@property (nonatomic, copy) NSString *fileUrl;
@property (nonatomic, copy) NSString *cai;
@property (nonatomic, copy) NSString *ding;
@property (nonatomic, copy) NSString *fileWidth;
@end

