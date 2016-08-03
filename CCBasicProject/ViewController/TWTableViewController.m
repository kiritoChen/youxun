//
//  TWTableViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/6/29.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "TWTableViewController.h"
#import "OnePicCell.h"
#import "ThreePicCell.h"
#import "WebViewController.h"
#import "CCPicViewController.h"
#import "CCVideoViewController.h"

@interface TWTableViewController ()<iCarouselDelegate, iCarouselDataSource>
@property (nonatomic) TuWanViewModel *tuWanVM;
// 头部滚动视图
@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIPageControl *pc;
@property (nonatomic) UILabel *titleLb;
@end

static NSString *identifyO = @"onePicCell";
static NSString *identifyT = @"threePicCell";


@implementation TWTableViewController{
    NSTimer *_timer;
}

- (instancetype)initWithStyle:(UITableViewStyle)style requestType:(TWDataRequestModel)type{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _requestType = type;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[OnePicCell class] forCellReuseIdentifier:identifyO];
    [self.tableView registerClass:[ThreePicCell class] forCellReuseIdentifier:identifyT];
    // 下方的宏可以自动把 self 转化为 weak 的 weakself
    WK(weakSelf)
    [self.tableView addHeaderRefresh:^{
        [weakSelf.tuWanVM getDataRequestModel:VMDataRequestModelRefresh CompletionHandler:^(NSError *error) {
            [weakSelf refreshhToplist];
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView addBackFooterRefresh:^{
        [weakSelf.tuWanVM getDataRequestModel:VMDataRequestModelMore CompletionHandler:^(NSError *error) {
            [weakSelf refreshhToplist];
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
}
// 刷新头部
- (void)refreshhToplist{
    [self.tableView reloadData];
    [_timer invalidate];
    _timer = nil;
    if (self.tuWanVM.isHasTop) {
        self.tableView.tableHeaderView = self.ic;
        _pc.numberOfPages = self.tuWanVM.topNumber;
        [self.ic reloadData];
        [self carouselCurrentItemIndexDidChange:self.ic];
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
    }else{
        self.tableView.tableHeaderView = nil;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - iCarousel Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.tuWanVM.topNumber;
}
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pc.currentPage = carousel.currentItemIndex;
    self.titleLb.text = [self.tuWanVM topTitleForIndex:carousel.currentItemIndex];
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.frame];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.bottom.equalTo(-30);
        }];
        imageView.tag = 100;
        imageView.clipsToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    UIImageView *iv = (UIImageView *)[view viewWithTag:100];
    [iv sd_setImageWithURL:[self.tuWanVM topIconURLForIndex:index] placeholderImage:[UIImage imageNamed:@"FY_背景图片"]];
    
    return view;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    TWContentType type = [self.tuWanVM contentTypeForRow:index];
    switch (type) {
        case TWContentTypeAll: {
            WebViewController *wv = [WebViewController new];
            wv.html = [self.tuWanVM htmlForRow:index];
            [self.navigationController pushViewController:wv animated:YES];
            break;
        }
        case TWContentTypePic: {
            CCPicViewController *picVC = [[CCPicViewController alloc] initWithAid:[self.tuWanVM aidForRow:index]];
            [self.navigationController pushViewController:picVC animated:YES];
            break;
        }
        case TWContentTypeVideo: {
            CCVideoViewController *videoVC = [[CCVideoViewController alloc] initWithAid:[self.tuWanVM aidForRow:index]];
            [self.navigationController pushViewController:videoVC animated:YES];
            break;
        }
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tuWanVM.numForRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.tuWanVM isOnePicStyleForRow:indexPath.row]) {
        OnePicCell *cell = [tableView dequeueReusableCellWithIdentifier:identifyO forIndexPath:indexPath];
        cell.titleLb.text = [self.tuWanVM titleForRow:indexPath.row];
        cell.detailLb.text = [self.tuWanVM detailForRow:indexPath.row];
        cell.clickLb.text = [self.tuWanVM clickForRow:indexPath.row];
        [cell.iconIV sd_setImageWithURL:[self.tuWanVM iconForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"FY_背景图片80"]];
        return cell;
    }else{
        ThreePicCell *cell = [tableView dequeueReusableCellWithIdentifier:identifyT forIndexPath:indexPath];
        cell.titleLb.text = [self.tuWanVM titleForRow:indexPath.row];
        cell.clicksLb.text = [self.tuWanVM clickForRow:indexPath.row];
        NSArray *tmpArr = [self.tuWanVM showItemsIconForRow:indexPath.row];
        for (int i = 0; i < cell.imageViews.count; i++) {
            UIImageView *iv = cell.imageViews[i];
            [iv sd_setImageWithURL:tmpArr[i] placeholderImage:[UIImage imageNamed:@"FY_背景图片80"]];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.tuWanVM isOnePicStyleForRow:indexPath.row]) {
        return [tableView fd_heightForCellWithIdentifier:identifyO configuration:^(OnePicCell * cell) {
            cell.titleLb.text = [self.tuWanVM titleForRow:indexPath.row];
            cell.detailLb.text = [self.tuWanVM detailForRow:indexPath.row];
            cell.clickLb.text = [self.tuWanVM clickForRow:indexPath.row];
            [cell.iconIV sd_setImageWithURL:[self.tuWanVM iconForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"FY_背景图片80"]];
        }];
    }else{
        return [tableView fd_heightForCellWithIdentifier:identifyT configuration:^(ThreePicCell * cell) {
            cell.titleLb.text = [self.tuWanVM titleForRow:indexPath.row];
            cell.clicksLb.text = [self.tuWanVM clickForRow:indexPath.row];
            NSArray *tmpArr = [self.tuWanVM showItemsIconForRow:indexPath.row];
            for (int i = 0; i < tmpArr.count; i++) {
                UIImageView *iv = cell.imageViews[i];
                [iv sd_setImageWithURL:tmpArr[i] placeholderImage:[UIImage imageNamed:@"FY_背景图片80"]];
            }
        }];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TWContentType type = [self.tuWanVM contentTypeForRow:indexPath.row];
    switch (type) {
        case TWContentTypeAll: {
            WebViewController *wv = [WebViewController new];
            wv.html = [self.tuWanVM htmlForRow:indexPath.row];
            [self.navigationController pushViewController:wv animated:YES];
            break;
        }
        case TWContentTypePic: {
            CCPicViewController *picVC = [[CCPicViewController alloc] initWithAid:[self.tuWanVM aidForRow:indexPath.row]];
            [self.navigationController pushViewController:picVC animated:YES];
            break;
        }
        case TWContentTypeVideo: {
            CCVideoViewController *videoVC = [[CCVideoViewController alloc] initWithAid:[self.tuWanVM aidForRow:indexPath.row]];
            [self.navigationController pushViewController:videoVC animated:YES];
            break;
        }
    }
    
}



#pragma mark     - LazyLoad 懒加载
- (TuWanViewModel *)tuWanVM {
	if(_tuWanVM == nil) {
		_tuWanVM = [[TuWanViewModel alloc] initWithType:self.requestType];
	}
	return _tuWanVM;
}
// 头部滚动视图
- (iCarousel *)ic{
    if (!_ic) {
        _ic = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW * 370 / 750 + 30)];
        _ic.type = 7;
        _ic.delegate = self;
        _ic.dataSource = self;
        // 滚动图片下方白条
        UIView *lineView =[UIView new];
        lineView.backgroundColor = kRGBA(235, 235, 235, 1);
        [_ic addSubview:lineView];
        _ic.scrollSpeed = 0.1;
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.height.equalTo(30);
        }];
        _pc = [UIPageControl new];
        [lineView addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-5);
            make.centerY.equalTo(0);
        }];
        _pc.numberOfPages = self.tuWanVM.topNumber;
        _pc.pageIndicatorTintColor = [UIColor grayColor];
        _pc.currentPageIndicatorTintColor = [UIColor blackColor];
        _titleLb = [UILabel new];
        [lineView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(5);
            make.right.equalTo(_pc.mas_left).equalTo(-8);
            make.centerY.equalTo(0);
        }];
    }
    return _ic;
}


@end
