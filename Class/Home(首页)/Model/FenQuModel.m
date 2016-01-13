//
//  FenQuModel.m
//  pudding
//
//  Created by 千锋 on 16/1/8.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "FenQuModel.h"

@implementation FenQuModel


+ (NSDictionary *)objectClassInArray{
    return @{@"eps" : [Eps class]};
}
/**
 *  跳过为定义的键
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
@implementation Eps

+ (Eps *)epsWithDictiony:(NSDictionary *)dic
{
    Eps *eps = [[Eps alloc]init];
    [eps setValuesForKeysWithDictionary:dic];
    return eps;
}

/**
 *  跳过为定义的键
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"image"]) {
        epsImage *image = [[epsImage alloc]init];
        [image setValuesForKeysWithDictionary:value];
    }
}

@end


@implementation epsImage
/**
 *  跳过为定义的键
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end


