//
//  FenQuTableViewCell.h
//  pudding
//
//  Created by 千锋 on 16/1/8.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FenQuModel;
@interface FenQuTableViewCell : UITableViewCell

/**
 *  刷新数据
 */
- (void)relayoutFenQuDataWithArray:(FenQuModel *)fenQu;

@end
