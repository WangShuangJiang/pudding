//
//  AllXinFanTableViewCell.h
//  pudding
//
//  Created by 千锋 on 16/1/12.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XinFanModel;

@interface AllXinFanTableViewCell : UITableViewCell

/**
 *  刷新数据
 */
- (void)relayoutDataWithXinFan:(XinFanModel *)leftXinFan and:(XinFanModel *)rightXinfan;

@end
