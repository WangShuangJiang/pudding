//
//  DockItem.m
//  sina
//
//  Created by 609972942 on 15/12/17.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "DockItem.h"

#define kButtonImageRatio 0.6

@implementation DockItem

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置图片以原比例显示
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        //从父视图移除lable
        [self.titleLabel removeFromSuperview];
    }
    return self;
}

//设置图片的布局
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    return CGRectMake(x, y, width, height);
}

- (void)setHighlighted:(BOOL)highlighted{}

@end
