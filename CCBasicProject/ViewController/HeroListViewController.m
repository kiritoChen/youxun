//
//  HeroListViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/27.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "HeroListViewController.h"
#import "AllHeroViewModel.h"
#import "HeroCell.h"
#import "HeroDetailViewController.h"

#define heroCell @"heroCell"
#define kIconWidth (kWindowW - 10 * 5) / 4

@interface HeroListViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *layout;
@property (nonatomic) AllHeroViewModel *allHeroVM;
@end

@implementation HeroListViewController
- (void)viewWillAppear:(BOOL)animated{
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.allHeroVM.numberOfIndex;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:heroCell forIndexPath:indexPath];
    [cell.iconIV sd_setImageWithURL:[self.allHeroVM iconForIndex:indexPath.row]];
    cell.cnNameLb.text = [self.allHeroVM cnNameForIndex:indexPath.row];
    return cell;
}
// 选择一个cell进行跳转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HeroDetailViewController *detailVC = [[HeroDetailViewController alloc] initWithStyle:UITableViewStylePlain iconImageURL:[self.allHeroVM iconForIndex:indexPath.row] enName:[self.allHeroVM enNameForIndex:indexPath.row]];
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WK(weakSelf)
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.allHeroVM getAllHeroDataListCompletionHandler:^(NSError *error) {
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
        }];
    }];
    [self.collectionView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HeroCell class] forCellWithReuseIdentifier:heroCell];
	}
	return _collectionView;
}

- (UICollectionViewFlowLayout *)layout {
	if(_layout == nil) {
		_layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 10;
        _layout.minimumInteritemSpacing = 10;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = kIconWidth;
        CGFloat height = width + 25;
        _layout.itemSize = CGSizeMake(width, height);
	}
	return _layout;
}

- (AllHeroViewModel *)allHeroVM {
	if(_allHeroVM == nil) {
		_allHeroVM = [[AllHeroViewModel alloc] init];
	}
	return _allHeroVM;
}


@end
