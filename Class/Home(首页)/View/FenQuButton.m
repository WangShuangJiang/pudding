//
//  FenQuButton.m
//  pudding
//
//  Created by 千锋 on 16/1/8.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "FenQuButton.h"

/**
 *  自身的长宽
 */
#define kSelfBoundsSize self.bounds.size

@interface FenQuButton ()

{
    /**
     *  播放次数的视图
     */
    UIView *_playCountView;
    /**
     *  播放次数的图片
     */
    UIImageView *_playImageView;
    /**
     *  播放次数
     */
    UILabel *_playCountLable;
}

@end

@implementation FenQuButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        [self.titleLabel setNumberOfLines:0];
        [self.titleLabel setFont:[UIFont systemFontOfSize:9]];
        [self.titleLabel setTextColor:[UIColor blackColor]];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.imageView setContentMode:UIViewContentModeScaleToFill];
        [self.imageView.layer setCornerRadius:3];
        
        [self createplayCountLable];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setFrameWithPlayCount];
}

/**
 *  创建播放次数label
 */
- (void)createplayCountLable
{
    //播放次数的view
    UIView *playCountView = [[UIView alloc]init];
    _playCountView = playCountView;
    [playCountView.layer setCornerRadius:2];
    [playCountView setBackgroundColor:[UIColor colorWithWhite:0.1f alpha:0.5f]];
    
    //播放次数的图片
    UIImageView *playImageView = [[UIImageView alloc]init];
    UIImage *playImage = [UIImage imageNamed:@"home_icon_episode_play"];
    [playImageView setImage:playImage];
    [playImageView setContentMode:UIViewContentModeScaleAspectFit];
    [playCountView addSubview:playImageView];
    _playImageView = playImageView;
    
    //显示播放次数的lable
    _playCountLable = [[UILabel alloc]init];
    [_playCountLable setTextColor:[UIColor whiteColor]];
    [_playCountLable setFont:[UIFont systemFontOfSize:8]];
    [_playCountLable setTextAlignment:NSTextAlignmentCenter];
//    [playCountView addSubview:playCountLable];
    [playCountView addSubview:_playCountLable];
   
    //添加到imageView上
    [self.imageView addSubview:_playCountView];
}
/**
 *  根据播放次数自适应宽度设置布局
 */
- (void)setFrameWithPlayCount
{
    _playCountLable.text = [NSString stringWithFormat:@"%ld",(long)_playCount];
    CGRect rect = [_playCountLable.text boundingRectWithSize:CGSizeMake(0, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8]} context:nil];
    [_playCountLable setFrame:CGRectMake(15, 0, rect.size.width, 15)];
    
    [_playImageView setFrame:CGRectMake(0, 1, 13, 13)];
    
    //根据子控件设置view的布局信息
    [_playCountView setFrame:CGRectMake(0, 0, 15+_playCountLable.bounds.size.width, 15)];
    [_playCountView setCenter:CGPointMake(self.imageView.bounds.size.width*0.85, self.imageView.bounds.size.height*0.85)];
}

/**
 *  设置图片布局
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = kSelfBoundsSize.width;
    CGFloat height = kSelfBoundsSize.height * 0.7;
    
    return CGRectMake(x, y, width, height);
}

/**
 *  设置标题布局
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat x = 0;
    CGFloat y = self.imageView.bounds.size.height;
    CGFloat width = kSelfBoundsSize.width;
    CGFloat height = kSelfBoundsSize.height * 0.3;
    
    return CGRectMake(x, y, width, height);
}

@end
