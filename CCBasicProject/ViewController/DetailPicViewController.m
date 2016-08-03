//
//  DetailPicViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "DetailPicViewController.h"
#import "DWViewModel.h"

@interface DetailPicViewController ()<MWPhotoBrowserDelegate>
@property (nonatomic) DWViewModel *duowanVM;
@end

@implementation DetailPicViewController
- (instancetype)initWithGalleryId:(NSString *)galleryId{
    if (self = [super init]) {
        _galleryId = galleryId;
    }
    return self;
}
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.duowanVM.picSum;
}
- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    return [MWPhoto photoWithURL:[self.duowanVM picURLForIndex:index]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self.duowanVM getPicGalleryId:_galleryId completionHandler:^(NSError *error) {
        [self reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (DWViewModel *)duowanVM {
	if(_duowanVM == nil) {
		_duowanVM = [[DWViewModel alloc] init];
	}
	return _duowanVM;
}

@end
