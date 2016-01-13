//
//  BannerTableViewCell.m
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import "BannerTableViewCell.h"

#define kScrollBannerRation 1
#define kHorizontalSpacing 10
@interface BannerTableViewCell ()<UIScrollViewDelegate>

@property (strong , nonatomic) UIScrollView *scrollBanner;
@property (strong , nonatomic) UIButton *categoryBtn;
@property (strong , nonatomic) UIButton *timeTableBtn;

@end

@implementation BannerTableViewCell
/**
 *  初始化tableViewCell
 *
 *  @param style           cell的类型
 *  @param reuseIdentifier 复用池的标志
 *
 *  @return 返回cell
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
//        [self createUI];
    }
    return self;
}

- (void)createUI
{
    
}

@end
