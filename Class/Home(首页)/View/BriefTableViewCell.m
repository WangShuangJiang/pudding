//
//  BriefTableViewCell.m
//  pudding
//
//  Created by 千锋 on 16/1/13.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "BriefTableViewCell.h"
#import "AFNetworking.h"
#import "XinFanModel.h"
#import "UIImageView+WebCache.h"
#define kScreenBounds [UIScreen mainScreen].bounds
@interface BriefTableViewCell ()

/**
 *  简介
 */
@property (strong , nonatomic) UIView *briefView;

//图片
@property (strong , nonatomic) UIImageView *icon;

//评分
@property (strong , nonatomic) UIImageView *starImage;

//声优标签
@property (strong , nonatomic) UIScrollView *shengYouScroll;

//看点标签
@property (strong , nonatomic) UIScrollView *lookScroll;

//动画简介
@property (strong , nonatomic) UIButton *brief;

@end

@implementation BriefTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createBriefView];
        [self setBackgroundColor:[UIColor colorWithRed:232.0f/256.0f green:240.0f/256.0f blue:240.0f/256.0f alpha:0.8]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}
/**
 *  创建简介界面
 */
- (void)createBriefView
{
    UIView *briefView = [[UIView alloc]init];
    
    //图片
    _icon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 50, 70)];
    [briefView addSubview:_icon];
    
    //评分
    _starImage = [[UIImageView alloc]initWithFrame:CGRectMake(70, 18, 50, 15)];
    [_starImage setImage:[UIImage imageNamed:@"StarsForeground"]];
    [briefView addSubview:_starImage];
    
    //声优
    UILabel *shengYou = [[UILabel alloc]initWithFrame:CGRectMake(70, 30, 25, 15)];
    [shengYou setText:@"声优:"];
    [shengYou setFont:[UIFont systemFontOfSize:10]];
    [briefView addSubview:shengYou];
    
    //声优标签
    _shengYouScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(110, 30, kScreenBounds.size.width - 120, 15)];
    [briefView addSubview:_shengYouScroll];
    
    UILabel *look = [[UILabel alloc]initWithFrame:CGRectMake(70, 50, 25, 15)];
    [look setText:@"看点:"];
    [look setFont:[UIFont systemFontOfSize:10]];
    [briefView addSubview:look];
    
    //看点标签
    _lookScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(110, 50, kScreenBounds.size.width - 120, 15)];
    [briefView addSubview:_lookScroll];
    
    //简介
    _brief = [UIButton buttonWithType:UIButtonTypeSystem];
    [_brief setFrame:CGRectMake(10, 80, kScreenBounds.size.width-10, 20)];
    [_brief.titleLabel setFont:[UIFont systemFontOfSize:9]];
    [_brief setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [briefView addSubview:_brief];
    
    [briefView setFrame:CGRectMake(0, 10, kScreenBounds.size.width, 110)];
    [briefView setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:briefView];
}

- (void)relayoutWithAnimation:(XinFanModel *)animation
{
    NSArray *shengYous = [_shengYouScroll subviews];
    for (UIButton *button in shengYous) {
        [button removeFromSuperview];
    }
    NSArray *looks = [_lookScroll subviews];
    for (UIButton *button in looks) {
        [button removeFromSuperview];
    }
    
    NSURL *url = [NSURL URLWithString:animation.image.url];
    [_icon sd_setImageWithURL:url];
    
    //创建声优标签
    CGFloat shengYoux = 0;
    for (NSInteger i = 0 ; i < animation.seiyuNames.count; i++) {
        NSString *shengYou = [animation.seiyuNames objectAtIndex:i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:shengYou forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:8]];
        CGRect rect = [button.currentTitle boundingRectWithSize:CGSizeMake(0, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8]} context:nil];
        [button setFrame:CGRectMake(shengYoux, 0, rect.size.width, 15)];
        shengYoux += rect.size.width + 10;
        [_shengYouScroll addSubview:button];
        [_shengYouScroll setContentSize:CGSizeMake(shengYoux + rect.size.width, 15)];
    }
    
    //创建看点标签
    CGFloat lookx = 0;
    for (NSInteger i = 0; i < animation.categoryNames.count; i++) {
        
        NSString *look = [animation.categoryNames objectAtIndex:i];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:look forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:8]];
        CGRect rect = [button.currentTitle boundingRectWithSize:CGSizeMake(0, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8]} context:nil];
        [button setFrame:CGRectMake(lookx, 0, rect.size.width, 15)];
        lookx += rect.size.width + 10;
        [_lookScroll addSubview:button];
        [_lookScroll setContentSize:CGSizeMake(lookx + rect.size.width, 15)];
    }
    
    //更新简介
    [_brief setTitle:animation.intro forState:UIControlStateNormal];
    
}

/**
 *  返回高度
 */
+ (void)briefCellHeight
{
    
}

@end
