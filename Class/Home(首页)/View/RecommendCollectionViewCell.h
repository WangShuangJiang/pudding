//
//  RecommendCollectionViewCell.h
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeBaseCollectionViewCell.h"

typedef void(^EnterAnimationDetail)(NSString *anmationID);

@interface RecommendCollectionViewCell : HomeBaseCollectionViewCell

/**
 *  进去动画详情的代码块
 */
@property (copy , nonatomic) EnterAnimationDetail enterAnmationDetail;

/**
 *  新番数组
 */
@property (strong , nonatomic) NSMutableArray *xinFanArray;

/**
 *  分区数组
 */
@property (strong , nonatomic) NSMutableArray *fenQuArray;

@property (copy , nonatomic) RefreshBlock refreshBlock;

@end
