//
//  TuWanModel.h
//  BasicProject
//
//  Created by chenc on 16/6/29.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TuWanDataModel,TuWanDataIndexpicModel,IndexpicInfochildModel,IndexpicShowitemModel,IndexpicShowitemInfoModel,TuWanDataListModel,ListInfochildModel,ListShowitemModel;

@interface TuWanModel : NSObject
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) TuWanDataModel *data;
@property (nonatomic, copy) NSString *code;
@end

@interface TuWanDataModel : NSObject
@property (nonatomic, strong) NSArray<TuWanDataIndexpicModel *> *indexpic;
@property (nonatomic, strong) NSArray<TuWanDataListModel *> *list;
@end
// indexpic------------------------------------------------------------
@interface TuWanDataIndexpicModel : NSObject
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
@property (nonatomic, strong) IndexpicInfochildModel *infoChild;
@property (nonatomic, copy) NSString *litpic;
@property (nonatomic, copy) NSString *aid;
@property (nonatomic, assign) NSInteger pictotal;
@property (nonatomic, strong) NSArray<IndexpicShowitemModel *> *showItem;
@property (nonatomic, copy) NSString *pubDate;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *timeStamp;
@property (nonatomic, copy) NSString *murl;
@property (nonatomic, copy) NSString *banner;
@property (nonatomic, copy) NSString *zangs;
@property (nonatomic, copy) NSString *writer;
@property (nonatomic, copy) NSString *timer;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *desc;
@end

@interface IndexpicInfochildModel : NSObject
@property (nonatomic, copy) NSString *later;
@property (nonatomic, copy) NSString *cn;
@property (nonatomic, copy) NSString *facial;
@property (nonatomic, copy) NSString *feature;
@property (nonatomic, copy) NSString *role;
@property (nonatomic, copy) NSString *shoot;
@end

@interface IndexpicShowitemModel : NSObject
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) IndexpicShowitemInfoModel *info;
@end

@interface IndexpicShowitemInfoModel : NSObject
@property (nonatomic, copy) NSString *width;
@property (nonatomic, assign) NSInteger height;
@end
// list---------------------------------------------------------
@interface TuWanDataListModel : NSObject
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
@property (nonatomic, strong) ListInfochildModel *infoChild;
@property (nonatomic, copy) NSString *litpic;
@property (nonatomic, copy) NSString *aid;
@property (nonatomic, assign) NSInteger pictotal;
@property (nonatomic, strong) NSArray<ListShowitemModel *> *showItem;
@property (nonatomic, copy) NSString *pubDate;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *timeStamp;
@property (nonatomic, copy) NSString *murl;
@property (nonatomic, copy) NSString *banner;
@property (nonatomic, copy) NSString *zangs;
@property (nonatomic, copy) NSString *writer;
@property (nonatomic, copy) NSString *timer;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *desc;
@end

@interface ListInfochildModel : NSObject
@property (nonatomic, copy) NSString *later;
@property (nonatomic, copy) NSString *cn;
@property (nonatomic, copy) NSString *facial;
@property (nonatomic, copy) NSString *feature;
@property (nonatomic, copy) NSString *role;
@property (nonatomic, copy) NSString *shoot;
@end

@interface ListShowitemModel : NSObject
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *width;
@property (nonatomic, assign) NSInteger height;
@end


