//
//  CCPicViewController.h
//  CCBasicProject
//
//  Created by chenc on 16/6/30.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <MWPhotoBrowser/MWPhotoBrowser.h>

@interface CCPicViewController : MWPhotoBrowser
//
- (instancetype)initWithAid:(NSString *)aid;
// 因为此页面的数据内容是关联着 aid 的, 使用 readOnly 杜绝被外部更改的可能性.
@property (nonatomic, readonly) NSString *aid;
@end
