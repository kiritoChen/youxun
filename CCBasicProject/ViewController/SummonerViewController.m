//
//  SummonerViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "SummonerViewController.h"
#import <WebKit/WebKit.h>

@interface SummonerViewController ()//<UIWebViewDelegate>
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation SummonerViewController
#pragma mark -  Delegate
//- (void)webViewDidStartLoad:(UIWebView *)webView{
//    [self.view showBusyHUD];
//}
//- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    [self.view hideBusyHUD];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[WKWebView alloc] init];
    [self.view addSubview:_webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(0);
        make.top.equalTo(30);
    }];
    [_webView loadRequest:[NSURLRequest requestWithURL:kSummonerSearch.cc_URL]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    
}


@end
