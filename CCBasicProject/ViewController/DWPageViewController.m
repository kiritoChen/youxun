//
//  DWPageViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/26.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "DWPageViewController.h"
#import "NewsViewController.h"
#import "HeroViewController.h"
#import "PhotoViewController.h"

@interface DWPageViewController ()

@end

@implementation DWPageViewController
- (NSArray<NSString *> *)titles{
    return @[@"头条", @"视频", @"赛事", @"靓照", @"囧图", @"壁纸"];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return self.titles[index];
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
//    NewsViewController *newsVC = [[NewsViewController alloc] initWithStyle:UITableViewStylePlain requestMode:index];
    if (index <= 2) {
        NewsViewController *newsVC = [[NewsViewController alloc] initWithStyle:UITableViewStylePlain requestMode:index];
        return newsVC;
    }else {
        PhotoViewController *photoVC = [[PhotoViewController alloc] initWithRequestMode:index];
        return photoVC;
    }
    
}

#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (instancetype)init{
    if (self = [super init]) {
        self.title = @"英雄联盟";
        self.tabBarItem.image = [UIImage imageNamed:@"lol"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"lol-h"];
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
