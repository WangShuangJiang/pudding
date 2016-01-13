//
//  XinFanModel.m
//  pudding
//
//  Created by 千锋 on 16/1/7.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "XinFanModel.h"

@implementation XinFanModel

/**
 *  跳过为定义的键
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"");
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"image"]) {
        
        _image = [[XinFanImage alloc]init];
        [_image setValuesForKeysWithDictionary:value];
        
    }
}

@end

@implementation XinFanImage

/**
 *  跳过为定义的键
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"");
}

@end


