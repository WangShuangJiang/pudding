//
//  HomeBaseCollectionViewCell.h
//  pudding
//
//  Created by 千锋 on 16/1/4.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BannerTableViewCell.h"
#import "BannerModel.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

typedef void(^RefreshBlock)();

@interface HomeBaseCollectionViewCell : UICollectionViewCell<UITableViewDataSource,UITableViewDelegate>

/**
 *  tableview展示数据
 */
@property (strong , nonatomic) UITableView *tableView;

/**
 *  横幅
 */
@property (strong , nonatomic) UIScrollView *scrollBanner;

/**
 *  页签控制器
 */
@property (strong , nonatomic) UIPageControl *pageControl;



/**
 *   创建tableView
 */
- (void)createTableView;

/**
 *  更新横幅
 *
 *  @param imageArray 横幅的图片模型数组
 */
- (void)relayoutBannerWithArray:(NSArray *)imageArray;

@end
