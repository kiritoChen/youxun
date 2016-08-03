//
//  CCPicModel.h
//  CCBasicProject
//
//  Created by chenc on 16/6/30.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCPicShowitemModel, CCPicRelevantModel;
@interface CCPicModel : NSObject
//@property (nonatomic, strong) NSArray<Esarray *> *esArray;
//@end
//
//@interface Esarray : NSObject

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;
//typename -> typeName
@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, copy) NSString *toutiao;

//@property (nonatomic, strong) Infochild *infochild;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, strong) NSArray<CCPicShowitemModel *> *showitem;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, assign) NSInteger zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, strong) NSArray<CCPicRelevantModel *> *relevant;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, strong) NSArray<CCPicShowitemModel *> *content;
//description -> desc
@property (nonatomic, copy) NSString *desc;

//@end
// infoChild 是首层字典中的字典, 可以进行合并编写
//@interface TRPicInfochildModel : NSObject

@property (nonatomic, copy) NSString *later;
@property (nonatomic, copy) NSString *cn;
@property (nonatomic, copy) NSString *facial;
@property (nonatomic, copy) NSString *feature;
@property (nonatomic, copy) NSString *role;
@property (nonatomic, copy) NSString *shoot;

@end

@interface CCPicShowitemModel : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;

//@property (nonatomic, strong) Info *info;
//
//@end
// 字典中有字典, 进行合并
//@interface Info : NSObject

@property (nonatomic, copy) NSString *width;

@property (nonatomic, assign) NSInteger height;

@end

@interface CCPicRelevantModel : NSObject
//description -> desc
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *litpic;
// typename-> typeName
@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, copy) NSString *pubdate;

@end


