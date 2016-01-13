//
//  XinFanButton.m
//  pudding
//
//  Created by 千锋 on 16/1/7.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "XinFanButton.h"

/**
 *  图片的占有比例
 */
#define kButtonImageRatio 0.8

/**
 *  自身的长宽
 */
#define kSelfBoundsSize self.bounds.size

@interface XinFanButton ()

{
    UILabel *_NewVideoTitleLable;
}

@end

@implementation XinFanButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置图片以原比例显示
        [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
        
        [self.titleLabel setFont:[UIFont systemFontOfSize:9]];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.imageView setClipsToBounds:YES];
        [self.imageView.layer setCornerRadius:2];
        
        [self createNewVideoTitleLable];
        
    }
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    [self upNewVideoNumber];
}

/**
 *  创建更新至n话的label
 */
- (void)createNewVideoTitleLable
{
    _NewVideoTitleLable = [[UILabel alloc]init];
    [_NewVideoTitleLable setBackgroundColor:[UIColor colorWithWhite:0.1f alpha:0.5f]];
    [_NewVideoTitleLable setFont:[UIFont systemFontOfSize:8]];
    [_NewVideoTitleLable setTextColor:[UIColor whiteColor]];
    [_NewVideoTitleLable setTextAlignment:NSTextAlignmentCenter];
    [self.imageView addSubview:_NewVideoTitleLable];
}

/**
 *  布局和添加更新至第几话
 */
- (void)upNewVideoNumber
{
    CGRect rect = [self NewVideoTitleRectForContentRect];
    [_NewVideoTitleLable setFrame:rect];
    [_NewVideoTitleLable setText:[NSString stringWithFormat:@"更新到%ld话",(long)_NewVideoNumber]];
}


/**
 *  设置图片布局
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = kSelfBoundsSize.width;
    CGFloat height = kSelfBoundsSize.height * kButtonImageRatio;
    
    return CGRectMake(x, y, width, height);
}

/**
 *  设置标题布局
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat x = kSelfBoundsSize.width * 0.1;
    CGFloat y = self.imageView.bounds.size.height;
    CGFloat width = kSelfBoundsSize.width * 0.8;
    CGFloat height = kSelfBoundsSize.height * 0.2;
    
    return CGRectMake(x, y, width, height);
}

/**
 *  设置更新至n话布局
 */
- (CGRect)NewVideoTitleRectForContentRect
{
    CGFloat x = 0;
    CGFloat y = self.imageView.bounds.size.height - (self.imageView.bounds.size.height * 0.2);
    CGFloat width = self.imageView.bounds.size.width;
    CGFloat height = self.imageView.bounds.size.height * 0.2;
    
    return CGRectMake(x, y, width, height);
}

@end
