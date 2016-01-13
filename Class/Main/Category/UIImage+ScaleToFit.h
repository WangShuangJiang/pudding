//
//  UIImage+ScaleToFit.h
//  WaterFall
//
//  Created by 千锋 on 15/11/26.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ScaleToFit)

- (CGSize)useSizeToScroll:(CGSize)targetSize;

+ (UIImage *)JPGImageName:(NSString *)imageName;

- (UIImage *)scaleImageWithScroll:(float)scale AndType:(NSString*)type;

@end
