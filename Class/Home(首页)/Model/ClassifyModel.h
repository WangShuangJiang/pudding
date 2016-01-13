//
//  ClassifyModel.h
//  pudding
//
//  Created by 千锋 on 16/1/12.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Children;
@interface ClassifyModel : NSObject


@property (nonatomic, copy) NSString *_id;
/**
 *  分区名
 */
@property (nonatomic, copy) NSString *name;
/**
 *  存储按钮数据
 */
@property (nonatomic, strong) NSArray *children;

@end

@interface Children : NSObject
/**
 *  按钮代表的ID
 */
@property (nonatomic, copy) NSString *_id;
/**
 *  按钮图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  按钮名字
 */
@property (nonatomic, copy) NSString *name;

+ (Children *)childrenWithDictiony:(NSDictionary *)dic;

@end

