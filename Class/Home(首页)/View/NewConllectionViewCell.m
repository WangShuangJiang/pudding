//
//  NewConllectionViewCell.m
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import "NewConllectionViewCell.h"
#import "AllXinFanTableViewCell.h"

@interface NewConllectionViewCell ()

/**
 *  存储数据数组
 */
@property (strong , nonatomic) NSMutableArray *leftArray;
@property (strong , nonatomic) NSMutableArray *rightArray;

@end

@implementation NewConllectionViewCell

- (void)createTableView
{
    [super createTableView];
    
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        self.refreshBlock();
    }];
    
    
    [self.tableView registerClass:[AllXinFanTableViewCell class] forCellReuseIdentifier:@"AllXinFanTableViewCell"];
}

- (void)relayoutAllXinFanWithArray:(NSArray *)xinFansArray
{
    _leftArray = [[NSMutableArray alloc]initWithCapacity:0];
    _rightArray = [[NSMutableArray alloc]initWithCapacity:0];
   
    for (NSInteger i = 0; i < xinFansArray.count; i++) {
        if (i%2) {
            [_leftArray addObject:xinFansArray[i]];
        }else{
            [_rightArray addObject:xinFansArray[i]];
        }
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return _leftArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        cell.textLabel.text = @"本季新番";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        AllXinFanTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AllXinFanTableViewCell"];
        if(_leftArray != nil && _rightArray != nil) {
            [cell relayoutDataWithXinFan:_leftArray[indexPath.row] and:_rightArray[indexPath.row]];
        }
        return cell;
    }
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 30;
    }
    CGFloat width = (self.contentView.bounds.size.width-15)/2;
    CGFloat height = (4*width/3)+35;
    return height + 5;
}

@end
