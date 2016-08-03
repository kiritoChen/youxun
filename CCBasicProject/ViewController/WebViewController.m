
//
//  WebViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/6/30.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()<UIWebViewDelegate>

@end

@implementation WebViewController
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.view showBusyHUD];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('fh-fixed')[0].style.display = 'none'"];
//    [self.view showBusyHUD];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.view showWarning:error.description];
}





- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] bk_initWithTitle:@"返回" style:UIBarButtonItemStyleDone handler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    self.navigationItem.leftBarButtonItem = btn;
    
    UIWebView *webView = [UIWebView new];
    [self.view addSubview:webView];
    webView.delegate = self;
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [webView loadRequest:[NSURLRequest requestWithURL:_html]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
