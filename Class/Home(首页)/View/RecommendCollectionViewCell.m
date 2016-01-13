//
//  RecommendCollectionViewCell.m
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import "RecommendCollectionViewCell.h"
#import "XinFanTableViewCell.h"
#import "FenQuTableViewCell.h"
@interface RecommendCollectionViewCell ()

@end

@implementation RecommendCollectionViewCell

- (void)createTableView
{
    [super createTableView];

    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
       _refreshBlock();
    }];
    
    //注册复用池
    [self.tableView registerClass:[XinFanTableViewCell class] forCellReuseIdentifier:@"XinFanTableViewCell"];
    [self.tableView registerClass:[FenQuTableViewCell class] forCellReuseIdentifier:@"FenQuTableViewCell"];
}

#pragma mark - 加载数据
- (void)setXinFanArray:(NSArray *)xinFanArray
{
    if (xinFanArray != nil) {
        _xinFanArray = [[NSMutableArray alloc]initWithArray:xinFanArray];
        [self.tableView reloadData];
    }
}

- (void)setFenQuArray:(NSMutableArray *)fenQuArray
{
    if (fenQuArray != nil) {
        _fenQuArray = [[NSMutableArray alloc]initWithArray:fenQuArray];
        [self.tableView reloadData];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 ) {
        XinFanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XinFanTableViewCell"];
        
        cell.enterAnmationDetail = ^(NSString *animationID){
            self.enterAnmationDetail(animationID);
        };
        
        if (self.xinFanArray != nil) {
            [self.tableView.mj_header endRefreshing];
            [cell relayoutXinFanWithArray:self.xinFanArray];
        }
        return cell;
    }
    FenQuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FenQuTableViewCell"];
    if (self.fenQuArray != nil) {
        [self.tableView.mj_header endRefreshing];
        [cell relayoutFenQuDataWithArray:self.fenQuArray[indexPath.row-1]];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 135;
    }
    return 300;
}

@end
