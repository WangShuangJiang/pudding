
//
//  AllXinFanTableViewCell.m
//  pudding
//
//  Created by 千锋 on 16/1/12.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "AllXinFanTableViewCell.h"
#import "AllXinFanButton.h"
#import "XinFanModel.h"
#import "UIButton+WebCache.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface AllXinFanTableViewCell ()

{
    AllXinFanButton *_leftButton;
    AllXinFanButton *_rightButton;
}

@end

@implementation AllXinFanTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
//        self.backgroundColor = [UIColor colorWithRed:233.0f/256.0f green:233.0f/256.0f blue:233.0f/256.0f alpha:1];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)createUI
{
    CGFloat width = (kScreenWidth-15)/2;
    CGFloat height = (4*width/3)+35;
    AllXinFanButton *leftButton = [[AllXinFanButton alloc]initWithFrame:CGRectMake(5, 2.5, width , height)];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _leftButton = leftButton;
    [self.contentView addSubview:leftButton];
    
    AllXinFanButton *rightButton = [[AllXinFanButton alloc]initWithFrame:CGRectMake(10 + width, 2.5, width, height)];
    [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _rightButton = rightButton;
    [self.contentView addSubview:rightButton];
    
}
/**
 *  刷新数据
 */
- (void)relayoutDataWithXinFan:(XinFanModel *)leftXinFan and:(XinFanModel *)rightXinfan
{
    [_leftButton setTitle:leftXinFan.name forState:UIControlStateNormal];
    NSURL *leftUrl = [NSURL URLWithString:leftXinFan.image.url];
    [_leftButton sd_setImageWithURL:leftUrl forState:UIControlStateNormal];
    [_leftButton setNewVideoNumber:leftXinFan.onairEpNumber];
    
    [_rightButton setTitle:rightXinfan.name forState:UIControlStateNormal];
    NSURL *rightUrl = [NSURL URLWithString:rightXinfan.image.url];
    [_rightButton sd_setImageWithURL:rightUrl forState:UIControlStateNormal];
    [_rightButton setNewVideoNumber:rightXinfan.onairEpNumber];
}

@end
