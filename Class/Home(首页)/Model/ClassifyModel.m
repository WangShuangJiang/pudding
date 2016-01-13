//
//  ClassifyModel.m
//  pudding
//
//  Created by 千锋 on 16/1/12.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "ClassifyModel.h"

@implementation ClassifyModel


+ (NSDictionary *)objectClassInArray{
    return @{@"children" : [Children class]};
}

/**
 *  跳过为定义的键
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"");
}



@end
@implementation Children

/**
 *  跳过为定义的键
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"");
}

+ (Children *)childrenWithDictiony:(NSDictionary *)dic
{
    Children *children = [[Children alloc]init];
    [children setValuesForKeysWithDictionary:dic];
    return children;
}

@end


