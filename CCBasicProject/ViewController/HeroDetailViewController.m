//
//  HeroDetailViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "HeaderView.h"
#import "HeroDetailViewModel.h"
#import "HeroSkillCell.h"
#define kIconWidth (kWindowW - 10 * 5) / 4

@interface HeroDetailViewController ()
@property (nonatomic) HeroDetailViewModel *detailVM;
@property (nonatomic) NSMutableArray<NSURL *> *skillIcons;
@end

static NSString *identifySkill = @"SkillCell";

@implementation HeroDetailViewController
- (instancetype)initWithStyle:(UITableViewStyle)style iconImageURL:(NSURL *)iconURL enName:(NSString *)enName{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _iconURL = iconURL;
        _enName = enName;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 自定义返回按钮
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backToSuperView:)];
    self.navigationItem.leftBarButtonItem = backItem;
    
    // 头部刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.detailVM getHeroDetailWithHeroName:_enName completionHandler:^(NSError *error) {
            [self.tableView.mj_header endRefreshing];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.tableView reloadData];
            }];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    [self.tableView registerClass:[HeroSkillCell class] forCellReuseIdentifier:identifySkill];
}
- (void)backToSuperView:sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HeroSkillCell *cell = [tableView dequeueReusableCellWithIdentifier:identifySkill forIndexPath:indexPath];
    [cell.skillIconIV sd_setImageWithURL:self.skillIcons[indexPath.row]];
    cell.skillDescLb.text = self.detailVM.skillDescriptions[indexPath.row];
    cell.skillNameLb.text = self.detailVM.skillFullNames[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:identifySkill configuration:^(HeroSkillCell * cell) {
        [cell.skillIconIV sd_setImageWithURL:self.skillIcons[indexPath.row]];
        cell.skillDescLb.text = self.detailVM.skillDescriptions[indexPath.row];
        cell.skillNameLb.text = self.detailVM.skillFullNames[indexPath.row];
    }];
}
// 组头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HeaderView *hv = [[HeaderView alloc] init];
    [hv.iconIV sd_setImageWithURL:_iconURL];
    hv.titleLb.text = self.detailVM.cnName;
    hv.priceLb.text = self.detailVM.price;
    hv.attributeLb.text = self.detailVM.attribute;
    return hv;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kIconWidth + 8 * 2;
}

#pragma mark     - LazyLoad 懒加载
- (HeroDetailViewModel *)detailVM {
	if(_detailVM == nil) {
		_detailVM = [[HeroDetailViewModel alloc] init];
	}
	return _detailVM;
}

- (NSMutableArray<NSURL *> *)skillIcons {
	if(_skillIcons == nil) {
		_skillIcons = [[NSMutableArray alloc] init];
        NSArray *skills = @[@"B", @"Q", @"W", @"E", @"R"];
        for (int i = 0; i < 5; i++) {
            NSString * path = [NSString stringWithFormat:kHeroSkillPath, _enName, skills[i]];
            [_skillIcons addObject:path.cc_URL];
        }
	}
	return _skillIcons;
}

@end
