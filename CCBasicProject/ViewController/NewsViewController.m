//
//  NewsViewController.m
//  CCBasicProject
//
//  Created by chenc on 16/7/26.
//  Copyright © 2016年 chencheng. All rights reserved.
//

#import "NewsViewController.h"
#import "DWViewModel.h"
#import "OnePicCell.h"
#import "WebViewController.h"

#define onePicCell @"onePicCell"

@interface NewsViewController ()
@property (nonatomic) DWViewModel *duowanVM;
@end

@implementation NewsViewController
- (instancetype)initWithStyle:(UITableViewStyle)style requestMode:(DWRequestMode)mode{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _requestMode = mode;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[OnePicCell class] forCellReuseIdentifier:onePicCell];
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        [weakSelf.duowanVM getDataRequestModel:VMDataRequestModelRefresh CompletionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView addBackFooterRefresh:^{
        [weakSelf.duowanVM getDataRequestModel:VMDataRequestModelMore CompletionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - PSCollectionView Delegate


#pragma mark - Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.duowanVM.numberForRow;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OnePicCell *cell = [tableView dequeueReusableCellWithIdentifier:onePicCell forIndexPath:indexPath];
//    cell.iconIV 
    [cell.iconIV sd_setImageWithURL:[self.duowanVM srcPhotoForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"FY_背景图片80"]];
    cell.titleLb.text = [self.duowanVM titleForRow:indexPath.row];
    cell.detailLb.text = [self.duowanVM titleForRow:indexPath.row];
    cell.clickLb.text = [self.duowanVM readCountForRow:indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.tableView fd_heightForCellWithIdentifier:onePicCell configuration:^(OnePicCell *cell) {
//        cell.iconIV 
        [cell.iconIV sd_setImageWithURL:[self.duowanVM srcPhotoForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"FY_背景图片80"]];
        cell.titleLb.text = [self.duowanVM titleForRow:indexPath.row];
        cell.detailLb.text = [self.duowanVM titleForRow:indexPath.row];
        cell.clickLb.text = [self.duowanVM readCountForRow:indexPath.row];
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    WebViewController *webVC = [[WebViewController alloc] init];
    webVC.html = [self.duowanVM artIdForRow:indexPath.row];
    [self.navigationController pushViewController:webVC animated:YES];
}


- (DWViewModel *)duowanVM {
	if(_duowanVM == nil) {
		_duowanVM = [[DWViewModel alloc] initNewsType:_requestMode];
	}
	return _duowanVM;
}


@end
