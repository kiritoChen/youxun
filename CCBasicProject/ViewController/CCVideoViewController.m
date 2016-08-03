//
//  CCVideoViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/1.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "CCVideoViewController.h"
#import "NetManager.h"
#import <WebKit/WebKit.h>
// iOS9 之后被抛弃的视频播放类库
@import MediaPlayer;

@interface CCVideoViewController ()

/** <#属性声明#> */
//@property (nonatomic) CCVideoModel *videoModel;
@end

@implementation CCVideoViewController
// 320 * 175
- (instancetype)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;
}

#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIWebView *webView = [[UIWebView alloc] init];
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    NSString *path = [NSString stringWithFormat:kVideoPath, _aid];
    [webView loadRequest:[NSURLRequest requestWithURL:path.cc_URL]];
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
//    [self.view addSubview:btn];
//    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(0);
//        make.top.equalTo(20);
//        make.height.equalTo(btn.mas_width).multipliedBy(175 / 320.0);
//    }];
    // BlockKit提供的按钮关联点击事件方法,不用另外写点击事件
//    [btn bk_addEventHandler:^(id sender) {
//        [btn setBackgroundImageWithURL:_videoModel.litPic.cc_URL forState:UIControlStateNormal placeholder:nil];
//        // 触发事件
//        NSURL *videoURL = _videoModel.content.firstObject.video.cc_URL;
//        MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
//        [self presentViewController:vc animated:YES completion:nil];
//        
//    } forControlEvents:UIControlEventTouchUpInside];
//    [self.view showBusyHUD];// '忙'提示
//    [NetManager getVideo:_aid completionHandler:^(CCVideoModel *model, NSError *error) {
//        _videoModel = model;
//        [self.view hideBusyHUD];
//    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
