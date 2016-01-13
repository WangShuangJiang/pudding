
//
//  AllXinFanButton.m
//  pudding
//
//  Created by 千锋 on 16/1/8.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "AllXinFanButton.h"

/**
 *  图片的占有比例
 */
#define kButtonImageRatio 0.7

/**
 *  自身的长宽
 */
#define kSelfBoundsSize self.bounds.size

@interface AllXinFanButton ()

{
    UILabel *_NewVideoTitleLable;
}

@end

@implementation AllXinFanButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        [self.layer setCornerRadius:2];
        
        [self.titleLabel setFont:[UIFont systemFontOfSize:9]];
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
    [_NewVideoTitleLable setText:@"更新至第话"];
    [_NewVideoTitleLable setFont:[UIFont systemFontOfSize:8]];
    [_NewVideoTitleLable setTextColor:[UIColor blackColor]];
    [self addSubview:_NewVideoTitleLable];
}

- (void)upNewVideoNumber
{
    CGRect rect = [self NewVideoTitleRectForContentRect];
    [_NewVideoTitleLable setFrame:rect];
    [_NewVideoTitleLable setText:[NSString stringWithFormat:@"更新至第%ld话",(long)_NewVideoNumber]];
}


/**
 *  设置图片布局
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
#warning 这里没有根据图片自适应
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = kSelfBoundsSize.width;
    CGFloat height = 4*width/3;
    
    return CGRectMake(x, y, width, height);
}

/**
 *  设置标题布局
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat x = 10;
    CGFloat y = self.imageView.bounds.size.height + 5;
    CGFloat width = kSelfBoundsSize.width - 10;
    CGFloat height = 15;
    
    return CGRectMake(x, y, width, height);
}

/**
 *  设置更新至n话布局
 */
- (CGRect)NewVideoTitleRectForContentRect
{
    CGFloat x = 10;
    CGFloat y = self.titleLabel.frame.origin.y + self.titleLabel.bounds.size.height ;
    CGFloat width = kSelfBoundsSize.width - 10;
    CGFloat height = 10;
    
    return CGRectMake(x, y, width, height);
}

/**
 *  返回self高度
 */
- (CGFloat)height;
{
    CGFloat height = 0;
    
    height += self.imageView.bounds.size.height;
    height += 20;
    height += 15;
    
    return height;
}

@end
