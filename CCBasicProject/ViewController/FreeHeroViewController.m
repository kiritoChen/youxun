//
//  FreeHeroViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/28.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "FreeHeroViewController.h"
#import "FreeHeroCell.h"
#import "FreeHeroViewModel.h"
#import "HeroDetailViewController.h"

@interface FreeHeroViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic) UICollectionViewFlowLayout *layout;
@property (nonatomic) FreeHeroViewModel *freeHeroVM;
@end

static NSString *identify = @"Cell";

@implementation FreeHeroViewController
#pragma mark - LifeCycle 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    WK(weakSelf);
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.freeHeroVM getDataListCompletionHandler:^(NSError *error) {
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
#pragma mark - Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.freeHeroVM.numberOfCell;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FreeHeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell.iconIV sd_setImageWithURL:[self.freeHeroVM iconForCell:indexPath.row]];
    cell.titleLb.text = [self.freeHeroVM titleForCell:indexPath.row];
    cell.cnNameLb.text = [self.freeHeroVM cnNameForCell:indexPath.row];
    cell.locationLb.text = [self.freeHeroVM locationForCell:indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HeroDetailViewController *detailVC = [[HeroDetailViewController alloc] initWithStyle:UITableViewStylePlain iconImageURL:[self.freeHeroVM iconForCell:indexPath.row] enName:[self.freeHeroVM enNameForCell:indexPath.row]];
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark     - LazyLoad 懒加载
- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.left.right.bottom.equalTo(0);
        }];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[FreeHeroCell class] forCellWithReuseIdentifier:identify];
        
        
	}
	return _collectionView;
}

- (UICollectionViewFlowLayout *)layout {
	if(_layout == nil) {
		_layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.minimumLineSpacing = 10;
        _layout.minimumInteritemSpacing = 10;
        _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = (kWindowW - 10 * 3) / 2;
        _layout.itemSize = CGSizeMake(width, 50);
	}
	return _layout;
}

- (FreeHeroViewModel *)freeHeroVM {
	if(_freeHeroVM == nil) {
		_freeHeroVM = [[FreeHeroViewModel alloc] init];
	}
	return _freeHeroVM;
}

@end
