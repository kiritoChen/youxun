
//@property (nonatomic, strong) NSArray<Esarray *> *esArray;
//
//  CCVideoModel.h
//  CCBasicProject
//
//  Created by chenc on 16/6/30.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCVideoContentModel,CCVideoRelevantModel;
@interface CCVideoModel : NSObject

//@end
//@interface Esarray : NSObject

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showType;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typeChild;

@property (nonatomic, copy) NSString *longTitle;

@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *touTiao;

@property (nonatomic, copy) NSString *litPic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *pubDate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timeStamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, strong) NSArray<CCVideoRelevantModel *> *relevant;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, strong) NSArray<CCVideoContentModel *> *content;

@property (nonatomic, copy) NSString *desc;

@end

@interface CCVideoContentModel : NSObject

@property (nonatomic, copy) NSString *video;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *text;

@end

@interface CCVideoRelevantModel : NSObject

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *litPic;

@property (nonatomic, copy) NSString *pubDate;

@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *timeStamp;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *typeChild;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *longTitle;

@end

