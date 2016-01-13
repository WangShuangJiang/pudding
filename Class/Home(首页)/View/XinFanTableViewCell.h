//
//  XinFanTableViewCell.h
//  pudding
//
//  Created by 千锋 on 16/1/4.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^EnterAnimationDetail)(NSString *anmationID);

@interface XinFanTableViewCell : UITableViewCell

/**
 *  进去动画详情的代码块
 */
@property (copy , nonatomic) EnterAnimationDetail enterAnmationDetail;

/**
 *  刷新新番数据
 *
 *  @param xinFanArray 存储新番数据模型的数组
 */
- (void)relayoutXinFanWithArray:(NSArray *)xinFanArray;

@end
