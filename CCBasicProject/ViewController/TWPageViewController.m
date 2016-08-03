//
//  TWPageViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/6/30.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "TWPageViewController.h"
#import "TWTableViewController.h"

@interface TWPageViewController ()

@end

@implementation TWPageViewController
- (NSArray<NSString *> *)titles{
    return @[@"头条", @"独家", @"暗黑3", @"魔兽", @"风暴", @"炉石", @"星际2", @"守望", @"图片", @"视频", @"攻略", @"幻化", @"趣闻", @"COS", @"美女"];
}
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index{
    return self.titles[index];
}
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    TWTableViewController *twVC = [[TWTableViewController alloc] initWithStyle:UITableViewStylePlain requestType:index];
    return twVC;
}

- (instancetype)init{
    if (self = [super init]) {
        self.tabBarItem.image = [UIImage imageNamed:@"资讯"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"资讯-h"];
    }
    return self;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"游戏资讯";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
