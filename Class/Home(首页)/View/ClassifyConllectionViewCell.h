//
//  ClassifyConllectionViewCell.h
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassifyConllectionViewCell : UICollectionViewCell

/**
 *  分区数组
 */
@property (strong , nonatomic) NSMutableArray *classifyArray;

- (void)relayoutDataWithArray:(NSArray *)classifyArray;

@end
