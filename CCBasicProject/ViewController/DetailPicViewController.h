//
//  DetailPicViewController.h
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import <MWPhotoBrowser/MWPhotoBrowser.h>

@interface DetailPicViewController : MWPhotoBrowser
- (instancetype)initWithGalleryId:(NSString *)galleryId;
@property (nonatomic, readonly) NSString *galleryId;
@end
