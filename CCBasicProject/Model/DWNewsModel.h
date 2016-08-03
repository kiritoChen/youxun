//
//  DWNewsModel.h
//  CCBasicProject
//
//  Created by chenc on 16/7/26.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DWNewsDataModel,DWNewsDataVideoListModel,DWNewsDataHeaderLineModel;

@interface DWNewsModel : NSObject
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, strong) NSArray<DWNewsDataModel *> *data;
@property (nonatomic, copy) NSString *order;
@property (nonatomic, copy) NSArray<DWNewsDataHeaderLineModel *> *headerline;
@property (nonatomic, copy) NSString *totalRecord;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) BOOL rs;
@property (nonatomic, assign) NSInteger totalPage;
@property (nonatomic, assign) NSInteger pageNum;
@end

@interface DWNewsDataModel : NSObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *video;
@property (nonatomic, copy) NSString *commentUrl;
@property (nonatomic, copy) NSString *ymzId;
@property (nonatomic, copy) NSString *destUrl;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *weight;
@property (nonatomic, assign) NSInteger commentSum;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *srcPhoto;
@property (nonatomic, copy) NSString *commentId;
@property (nonatomic, strong) NSArray<DWNewsDataVideoListModel *> *videoList;
@property (nonatomic, copy) NSString *readCount;
@property (nonatomic, copy) NSString *artId;
@property (nonatomic, assign) NSInteger hasVideo;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *coverHeight;
@property (nonatomic, copy) NSString *galleryId;
@property (nonatomic, copy) NSString *updated;
//@property (nonatomic, copy) NSString *destUrl;
@property (nonatomic, copy) NSString *coverWidth;
//@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *picsum;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, copy) NSString *coverUrl;
@property (nonatomic, copy) NSString *commentCount;
@property (nonatomic, copy) NSString *clicks;
@property (nonatomic, copy) NSString *modifyTime;
@end

@interface DWNewsDataHeaderLineModel : NSObject
@property (nonatomic, copy) NSString *weight;
@property (nonatomic, copy) NSString *commentUrl;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *created;
@property (nonatomic, copy) NSString *destUrl;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *artId;
@property (nonatomic, assign) NSInteger commentSum;
@end

@interface DWNewsDataVideoListModel : NSObject
@property (nonatomic, copy) NSString *vid;
@property (nonatomic, copy) NSString *uu;
@end


