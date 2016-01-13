//
//  BannerModel.h
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannerModel : NSObject
/**
 *  图片的链接URL字符串
 */
@property (nonatomic, copy) NSString *url;

/**
 *  图片本身的URL字符串
 */
@property (nonatomic, copy) NSString *imageUrl;

@end
