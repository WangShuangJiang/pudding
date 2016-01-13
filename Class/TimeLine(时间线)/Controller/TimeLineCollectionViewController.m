//
//  TimeLineCollectionViewController.m
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import "TimeLineCollectionViewController.h"

@interface TimeLineCollectionViewController ()

@end

@implementation TimeLineCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置起始点(0,0)为导航栏下的视图左上角为起始点
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //设置按页翻页
    self.collectionView.pagingEnabled = YES;
    //隐藏滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //禁止弹性滑动
    self.collectionView.bounces  = NO;
    
    //    注册复用池
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f blue:arc4random()%256/255.0f alpha:1];
    
    return cell;
}


@end
