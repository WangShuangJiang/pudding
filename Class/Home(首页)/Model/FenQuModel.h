//
//  FenQuModel.h
//  pudding
//
//  Created by 千锋 on 16/1/8.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Eps,epsImage;
@interface FenQuModel : NSObject
/**
 *  分区的ID
 */
@property (nonatomic, copy) NSString *_id;
/**
 *  存储分区的内容
 */
@property (nonatomic, strong) NSArray *eps;
/**
 *  分区的横幅
 */
@property (nonatomic, strong) NSArray *banners;
/**
 *  分区的头标的字符串型的链接
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  分区的名字
 */
@property (nonatomic, copy) NSString *name;

@end

@interface Eps : NSObject
/**
 *  通过数组返回模型
 */
+ (Eps *)epsWithDictiony:(NSDictionary *)dic;

@property (nonatomic, assign) NSInteger coinCount;

@property (nonatomic, assign) NSInteger status;
/**
 *  分区视频模型的标题
 */
@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger duration;
/**
 *  分区视频模型的图片模型
 */
@property (nonatomic, strong) epsImage *image;

@property (nonatomic, copy) NSString *_id;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger t;

@property (nonatomic, copy) NSString *activityId;

@property (nonatomic, assign) BOOL isMusic;
/**
 *  播放次数
 */
@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, copy) NSString *animeId;

@property (nonatomic, assign) NSInteger number;

@property (nonatomic, assign) BOOL isFromAudio;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, assign) NSInteger voteCount;

@property (nonatomic, assign) NSInteger bulletCount;

@property (nonatomic, assign) NSInteger insertedTime;

@property (nonatomic, copy) NSString *policy;

@property (nonatomic, copy) NSString *userId;

@end

@interface epsImage : NSObject

/**
 *  分区视频模型的图片链接
 */
@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, assign) NSInteger height;

@end

