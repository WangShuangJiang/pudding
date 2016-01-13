//
//  UIImage+ScaleToFit.m
//  WaterFall
//
//  Created by 千锋 on 15/11/26.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import "UIImage+ScaleToFit.h"

@implementation UIImage (ScaleToFit)

- (CGSize)useSizeToScroll:(CGSize)targetSize
{
    
    if (targetSize.width == 0 && targetSize.height > 0)
    {
        float x = 0;
        x = targetSize.height * self.size.width / self.size.height;
        return CGSizeMake(x, targetSize.height);
    }
    else if(targetSize.height == 0 && targetSize.width > 0)
    {
        return CGSizeMake(targetSize.width, targetSize.width*self.size.height/self.size.width);
    }
    return CGSizeZero;
}

+ (UIImage *)JPGImageName:(NSString *)imageName
{
    NSString *path = [[NSBundle mainBundle]pathForResource:imageName ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    return image;
}

- (UIImage *)scaleImageWithScroll:(float)scale AndType:(NSString *)type
{
    NSData *imageData = UIImageJPEGRepresentation(self, scale);
    
    return [UIImage imageWithData:imageData];
}

@end
