//
//  NewConllectionViewCell.h
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeBaseCollectionViewCell.h"

@interface NewConllectionViewCell : HomeBaseCollectionViewCell

/**
 *  新番数组
 */
@property (strong , nonatomic) NSMutableArray *allXinFanArray;

@property (copy , nonatomic) RefreshBlock refreshBlock;

/**
 *  刷新数据
 */
- (void)relayoutAllXinFanWithArray:(NSArray *)xinFansArray;

@end
