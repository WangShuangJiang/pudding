//
//  BriefTableViewCell.h
//  pudding
//
//  Created by 千锋 on 16/1/13.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XinFanModel;

@interface BriefTableViewCell : UITableViewCell

- (void)relayoutWithAnimation:(XinFanModel *)animation;

@end
