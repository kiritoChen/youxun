//
//  PersonalViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "PersonalViewController.h"
#import "MineView.h"
#import "FooterView.h"
#import "NormalCell.h"
#import "Tools.h"
#import "RegisterViewController.h"
#import "LoginViewController.h"
#import "FeedBackViewController.h"

@interface PersonalViewController ()<UITableViewDelegate, UITableViewDataSource>
/** 列表 */
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic) MineView *mineView;
@property (nonatomic) FooterView *exitView;
@property (nonatomic) NSString *cacheSize;
// 用户名
@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *footerBtnTitle;// 登录按钮的显示
@end

static NSString *identify = @"normalCell";

@implementation PersonalViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        _cacheSize = [Tools getCacheSize];
        [self.tableView reloadData];
    }];
}

- (instancetype)init{
    if (self = [super init]) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"我的联盟"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"我的联盟-h"];
    }
    return self;
}
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    UIBarButtonItem *loginBtn = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(userLogin:)];
    self.navigationItem.rightBarButtonItem = loginBtn;
}
// 注册按钮点击事件
- (void)userLogin:sender{
    RegisterViewController *loginVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}
// 键盘消失


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableVIew Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else {
        return 2;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NormalCell *cell = [tableView dequeueReusableCellWithIdentifier:identify forIndexPath:indexPath];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.imageV.image = [UIImage imageNamed:@"我的收藏"];
                cell.titleLb.text = @"我的收藏";
                break;
            case 1:
                cell.imageV.image = [UIImage imageNamed:@"清除缓存"];
                cell.titleLb.text = @"清除缓存";
                cell.descLb.text = _cacheSize;
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                cell.imageV.image = [UIImage imageNamed:@"设置-1"];
                cell.titleLb.text = @"设置";
                break;
            case 1:
                cell.imageV.image = [UIImage imageNamed:@"意见反馈-1"];
                cell.titleLb.text = @"意见反馈";
                break;
            default:
                break;
        }
    }
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return self.mineView;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 240;
    }
    return 20;
}
// 点击进行跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 清除缓存数据
    if (indexPath.section == 0 && indexPath.row == 1) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"清楚缓存" message:@"如果清除缓存，下次加载可能会耗费部分流量哦~" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *actionSure = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [Tools removeCacheData];
            _cacheSize = [Tools getCacheSize];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.tableView reloadData];
            }];
        }];
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"不了" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:actionSure];
        [alertVC addAction:actionCancel];
        [self presentViewController:alertVC animated:YES completion:nil];
    }
    if (indexPath.section == 1 && indexPath.row == 1) {
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:[FeedBackViewController new] animated:YES];
    }

    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 30;
}
#pragma mark     - LazyLoad 懒加载
- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[NormalCell class] forCellReuseIdentifier:identify];
        // 脚部退出登录
        _tableView.tableFooterView = self.exitView;
	}
	return _tableView;
}

- (MineView *)mineView {
    if(_mineView == nil) {
        _mineView = [[MineView alloc] init];
        [_mineView.avatarBtn setImage:[UIImage imageNamed:@"用户头像"] forState:UIControlStateNormal];
        [_mineView.avatarBtn setImage:[UIImage imageNamed:@"用户头像-h"] forState:UIControlStateHighlighted];
        _mineView.userNameLb.text = [EMClient sharedClient].isLoggedIn ? [EMClient sharedClient].currentUsername : @"user";
    }
    return _mineView;
}

- (FooterView *)exitView {
    if(_exitView == nil) {
        _exitView = [[FooterView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, 40)];
        if ([EMClient sharedClient].isLoggedIn) {
            [_exitView.exitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
            [_exitView.exitBtn bk_addEventHandler:^(id sender) {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    EMError *error = [[EMClient sharedClient] logout:YES];
                    if (!error) {
                        [self.view showWarning:@"成功退出登录"];
                        [_exitView.exitBtn setTitle:@"点我登录，喵~" forState:UIControlStateNormal];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.tableView reloadData];
                        });
                    }
                }];
                
            } forControlEvents:UIControlEventTouchUpInside];
        }
        [_exitView.exitBtn bk_addEventHandler:^(id sender) {
            LoginViewController *loginVC = [LoginViewController new];
            [self.navigationController pushViewController:loginVC animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _exitView;
}




@end





















