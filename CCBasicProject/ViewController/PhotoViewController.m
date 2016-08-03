//
//  PhotoViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/26.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCell.h"
#import "DetailPicViewController.h"

@interface PhotoViewController ()<PSCollectionViewDelegate, PSCollectionViewDataSource>
@property (nonatomic) PSCollectionView *collectionView;
@property (nonatomic) DWViewModel *duowanVM;
@end

@implementation PhotoViewController
- (instancetype)initWithRequestMode:(DWRequestMode)mode{
    if (self = [super init]) {
        _mode = mode;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    WK(weakSelf);
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.duowanVM getDataRequestModel:VMDataRequestModelRefresh CompletionHandler:^(NSError *error) {
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
        }];
    }];
    [self.collectionView addBackFooterRefresh:^{
        [weakSelf.duowanVM getDataRequestModel:VMDataRequestModelMore CompletionHandler:^(NSError *error) {
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endFooterRefresh];
        }];
    }];
    [self.collectionView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - PSCollection Delegate
- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView{
    return self.duowanVM.numberForIndex;
}
- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index{
//    CGSize photoSize = [self.duowanVM coverSizeForIndex:index];
    PSCollectionViewCell *cell = [collectionView dequeueReusableViewForClass:[PSCollectionViewCell class]];
    if (!cell) {
        cell = [PSCollectionViewCell new];
        UIImageView *photoIV = [UIImageView new];
        [cell addSubview:photoIV];
        [photoIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
        }];
        photoIV.tag = 100;
        // 图片的标题
        UILabel *titleLb = [UILabel new];
        [cell addSubview:titleLb];
        [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(photoIV.mas_bottom);
            make.left.right.equalTo(0);
            make.height.equalTo(39);
        }];
        titleLb.numberOfLines = 2;
        titleLb.font = [UIFont systemFontOfSize:16];
        titleLb.tag = 200;
        // 数量和浏览数
        UIView *grayView = [UIView new];
        [photoIV addSubview:grayView];
        [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(15);
        }];
        grayView.backgroundColor = kRGBA(0, 0, 0, 0.7);
        // 数量
        UILabel *commentLb = [UILabel new];
        [grayView addSubview:commentLb];
        [commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(1);
            make.left.equalTo(8);
        }];
        commentLb.font = [UIFont systemFontOfSize:13];
        commentLb.textColor = [UIColor whiteColor];
        commentLb.tag = 301;
        // 浏览数
        UILabel *readLb = [UILabel new];
        [grayView addSubview:readLb];
        [readLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(1);
            make.right.equalTo(-8);
            make.left.equalTo(commentLb.mas_right);
            make.width.equalTo(commentLb);
        }];
        readLb.font = [UIFont systemFontOfSize:13];
        readLb.textColor = [UIColor whiteColor];
        readLb.textAlignment = NSTextAlignmentRight;
        readLb.tag = 302;
        UIView *greenView = [UIView new];
        [cell addSubview:greenView];
        [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.equalTo(0);
            make.height.equalTo(1);
            make.top.equalTo(titleLb.mas_bottom);
        }];
        greenView.backgroundColor = kBGColor;
    }
    UIImageView *photoIV = (UIImageView *)[cell viewWithTag:100];
    [photoIV sd_setImageWithURL:[self.duowanVM coverForIndex:index] placeholderImage:[UIImage imageNamed:@"FY_背景图片80"]];
    UILabel *titleLb = (UILabel *)[cell viewWithTag:200];
    titleLb.text = [self.duowanVM titleForIndex:index];
    UILabel *commentLb = (UILabel *)[cell viewWithTag:301];
    commentLb.text = [self.duowanVM havePicSumForIndex:index];
    UILabel *readLb = (UILabel *)[cell viewWithTag:302];
    readLb.text = [self.duowanVM commentCountForIndex:index];
    return cell;
}
- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index{
    CGSize photoSize = [self.duowanVM coverSizeForIndex:index];
    CGFloat width = photoSize.width;
    CGFloat height = photoSize.height;
    // PSCollectionView.m文件头部位置定义了kMargin宏，显示间距为8px；
    CGFloat photoWidth = (kWindowW - 8 * 3) / 2;
    return photoWidth * height / width + 40;
}

- (void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index{
    DetailPicViewController *detailPicVC = [[DetailPicViewController alloc] initWithGalleryId:[self.duowanVM galleryIdForIndex:index]];
    [self.navigationController pushViewController:detailPicVC animated:YES];
}

#pragma mark     - LazyLoad 懒加载
- (PSCollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[PSCollectionView alloc] init];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _collectionView.collectionViewDelegate = self;
        _collectionView.collectionViewDataSource = self;
        // 设置竖屏时候的列的数量
        _collectionView.numColsPortrait = 2;
        _collectionView.numColsLandscape = 2;
	}
	return _collectionView;
}

- (DWViewModel *)duowanVM {
	if(_duowanVM == nil) {
		_duowanVM = [[DWViewModel alloc] initNewsType:_mode];
	}
	return _duowanVM;
}

@end
