//
//  CCPicViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/6/30.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "CCPicViewController.h"
#import "NetManager.h"

@interface CCPicViewController ()<MWPhotoBrowserDelegate>
@property (nonatomic) CCPicModel *picModel;
@end

@implementation CCPicViewController
#pragma mark -  Delegate
// 有多少个图片，是返回值中content数组
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return _picModel.content.count;
}
//
- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    return [MWPhoto photoWithURL:_picModel.content[index].pic.cc_URL];
}



- (instancetype)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;// 自身的协议方法由自身负责
    //调用picViewModel发送请求, 获取对应的数据
    //获取数据成功时, 刷新当前页面
    [self.view showBusyHUD];
    [NetManager getPic:_aid completionHandler:^(CCPicModel *model, NSError *error) {
        [self.view hideBusyHUD];
        _picModel = model;
        [self reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
