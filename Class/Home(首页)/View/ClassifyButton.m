//
//  ClassifyButton.m
//  pudding
//
//  Created by 千锋 on 16/1/12.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "ClassifyButton.h"

#define kButtonImageRatio 0.6

@implementation ClassifyButton

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
        
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.titleLabel setFont:[UIFont systemFontOfSize:10]];
        
    }
    return self;
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat x = 0;
    CGFloat y = self.bounds.size.height * kButtonImageRatio - 3;
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height * (1 - kButtonImageRatio);
    
    return CGRectMake(x, y, width, height);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height * kButtonImageRatio;
    
    return CGRectMake(x, y, width, height);
}

- (void)setHighlighted:(BOOL)highlighted{}


@end
