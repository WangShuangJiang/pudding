//
//  XinFanModel.h
//  pudding
//
//  Created by 千锋 on 16/1/7.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XinFanImage;
@interface XinFanModel : NSObject

@property (nonatomic, assign) NSInteger chatGroupCount;

@property (nonatomic, assign) NSInteger pushedEpNumber;

@property (nonatomic, assign) NSInteger relatedImageTopicCount;

@property (nonatomic, assign) NSInteger viewMode;


/**
 *  新番的图片
 */
@property (nonatomic, strong) XinFanImage *image;

@property (nonatomic, assign) NSInteger relatedTopicCount;

@property (nonatomic, assign) NSInteger picCount;
/**
 *  动画的ID
 */
@property (nonatomic, copy) NSString *_id;

@property (nonatomic, copy) NSString *intro;

/**
 *  更新至多少集
 */
@property (nonatomic, assign) NSInteger onairEpNumber;

@property (nonatomic, assign) BOOL newEpUpComming;

@property (nonatomic, strong) NSArray *scenaristNames;

@property (nonatomic, assign) NSInteger displayPlayCount;

/**
 *  新番的名字
 */
@property (nonatomic, copy) NSString *name;
/**
 *  新番的分数
 */
@property (nonatomic, assign) NSInteger score;

@property (nonatomic, strong) NSArray *aliases;

@property (nonatomic, strong) NSArray *seiyuNames;

@property (nonatomic, assign) BOOL isEpCollection;

@property (nonatomic, assign) NSInteger relatedVideoTopicCount;

@property (nonatomic, strong) NSArray *relatedTags;

@property (nonatomic, copy) NSString *onairRuleDescription;

@property (nonatomic, strong) NSArray *studios;

@property (nonatomic, strong) NSArray *categoryNames;

@property (nonatomic, assign) NSInteger totalEpCount;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, strong) NSArray *directorNames;

@property (nonatomic, strong) NSArray *videoSources;


@end
@interface XinFanImage : NSObject

/**
 *  新番的图片的链接
 */
@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger width;

@property (nonatomic, assign) NSInteger height;

@end

