//
//  PageViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "PageViewController.h"
#import "HeroListViewController.h"
#import "SummonerViewController.h"
#import "FreeHeroViewController.h"

@interface PageViewController ()
@end

@implementation PageViewController
- (instancetype)init{
    if (self = [super init]) {
        self.title = @"工具";
        self.tabBarItem.image = [UIImage imageNamed:@"工具"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"工具-h"];
    }
    return self;
}
- (NSArray<NSString *> *)titles{
    return @[@"one", @"two", @"three"];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return self.titles[index];
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    if (index == 0) {
        HeroListViewController *heroVC = [[HeroListViewController alloc] init];
        return heroVC;
    }
    if (index == 1) {
        FreeHeroViewController *freeVC = [[FreeHeroViewController alloc] init];
        return freeVC;
    }
    if (index == 2) {
        SummonerViewController *vc = [[SummonerViewController alloc] init];
        return vc;
    }
    return nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuView.hidden = YES;
    self.scrollView.scrollEnabled = NO;
    self.view.backgroundColor = kBGColor;
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"英雄列表", @"周免英雄", @"召唤师查询"]];
    segment.tintColor = [UIColor whiteColor];
    [segment addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    [segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(0);
        make.height.equalTo(30);
    }];
    segment.selectedSegmentIndex = 0;
    
    
}

- (void)changeViewController:(UISegmentedControl *)segment{
    switch (segment.selectedSegmentIndex) {
        case 0:
            self.selectIndex = 0;
            break;
        case 1:
            self.selectIndex = 1;
            break;
        case 2:
            self.selectIndex = 2;
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
