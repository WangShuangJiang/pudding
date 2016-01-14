//
//  AniCountTableViewCell.m
//  pudding
//
//  Created by 千锋 on 16/1/13.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "AniCountTableViewCell.h"
#import "XinFanModel.h"

#define kScreenBounds [UIScreen mainScreen].bounds

@interface AniCountTableViewCell ()

/**
 *  分集
 */
@property (strong , nonatomic) UIScrollView *aniCountScroll;

@end

@implementation AniCountTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createAnimationCount];
        
        [self setBackgroundColor:[UIColor colorWithRed:232.0f/256.0f green:240.0f/256.0f blue:240.0f/256.0f alpha:0.8]];
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)createAnimationCount
{
    _aniCountScroll = [[UIScrollView alloc]init];
    _aniCountScroll.pagingEnabled = YES;
    _aniCountScroll.showsHorizontalScrollIndicator = NO;
    _aniCountScroll.showsVerticalScrollIndicator = NO;
    [self.contextView addSubview:_aniCountScroll];
}

- (void)relayoutAnimationCountWithAnimation:(XinFanModel *)animation
{
    
    NSArray *animations = [_aniCountScroll subviews];
    for (UIButton *button in animations) {
        [button removeFromSuperview];
    }
    
    CGFloat x = 10;
    CGFloat y = 10;
    CGFloat width = (kScreenBounds.size.width - 60)/5;
    CGFloat height = 20;
    
    for (NSInteger i = 0; i < animation.onairEpNumber; i++) {
        
        NSInteger page = i/15;
        
        UIButton *animationBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        if (x+width>kScreenBounds.size.width) {
            x = 10 + (page * kScreenBounds.size.width);
            y += height+ 10;
        }
        
        [animationBtn setFrame:CGRectMake(x, y, width, height)];
        [animationBtn.titleLabel setFont:[UIFont systemFontOfSize:9]];
        [animationBtn setTitle:[NSString stringWithFormat:@"%ld",(long)i+1] forState:UIControlStateNormal];
        [animationBtn setBackgroundColor:[UIColor redColor]];
        [animationBtn.layer setCornerRadius:5];
        x += width + 10 + (page * kScreenBounds.size.width);
        
        [_aniCountScroll addSubview:animationBtn];
        
    }
    [_aniCountScroll setFrame:CGRectMake(0, 0, kScreenBounds.size.width, y + height +10)];
    [_aniCountScroll setContentSize:CGSizeMake(x + kScreenBounds.size.width - 10, y + height +10)];
}



@end
