//
//  AllXinFanButton.h
//  pudding
//
//  Created by 千锋 on 16/1/8.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllXinFanButton : UIButton

/**
 *  更新至n话
 */
@property (assign , nonatomic) NSInteger NewVideoNumber;
/**
 *   新番图片
 */
@property (strong , nonatomic) UIImage *image;

- (CGFloat)height;

@end
