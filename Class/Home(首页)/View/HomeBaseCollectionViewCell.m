//
//  HomeBaseCollectionViewCell.m
//  pudding
//
//  Created by 千锋 on 16/1/4.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "HomeBaseCollectionViewCell.h"

@interface HomeBaseCollectionViewCell ()<UITableViewDataSource,UITableViewDelegate>

@property (strong , nonatomic) NSMutableArray *bannerArray;

@end

@implementation HomeBaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self createUI];
        
#warning 没有实现手动滚动时停止自动滚动
        //横幅滚动
        [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(runningTimer) userInfo:nil repeats:YES];
    
    }
    return self;
}
#pragma mark -  搭建界面
/**
 *  创建tableView
 */
- (void)createUI
{
    [self createTableView];
    [self createHeaderView];
}
/**
 *   创建tableView
 */
- (void)createTableView
{
    
    //    创建tableView
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, self.contentView.bounds.size.height)];
    //    设置代理
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //    隐藏滚动条
    _tableView.showsVerticalScrollIndicator = NO;
    //    隐藏分割线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //    注册复用池
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    //    将tableView添加到cell上
    [self.contentView addSubview:_tableView];

}
/**
 *  创建headerView
 */
- (void)createHeaderView
{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    
    //    创建展示横幅的scrollview
    _scrollBanner = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,100)];
    _scrollBanner.backgroundColor = [UIColor cyanColor];
    //    隐藏滚动条
    _scrollBanner.showsHorizontalScrollIndicator = NO;
    _scrollBanner.showsVerticalScrollIndicator = NO;
    //    禁止弹性滑动
    //    _scrollBanner.bounces = NO;
    //    设置按页翻页
    _scrollBanner.pagingEnabled = YES;
    //    设置代理
    _scrollBanner.delegate = self;
    [headerView addSubview:_scrollBanner];
    
    //    创建页签控制器
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(kScreenWidth/3, 80, kScreenWidth/3, 20)];
    _pageControl.pageIndicatorTintColor = [UIColor cyanColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    [headerView addSubview:_pageControl];
    
    //创建补番按钮
    UIButton *categoryBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [categoryBtn setFrame:CGRectMake(10, 110, (kScreenWidth-30)/2, 40)];
    //设置按钮图片
    UIImage *categoryImage = [UIImage imageNamed:@"home_btn_category"];
    [categoryBtn setBackgroundImage:categoryImage forState:UIControlStateNormal];
    [headerView addSubview:categoryBtn];
    
    //创建追番按钮
    UIButton *timeTableBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [timeTableBtn setFrame:CGRectMake(20+categoryBtn.bounds.size.width, 110, (kScreenWidth-30)/2, 40)];
    //    添加背景图片
    UIImage *timeTableImage = [UIImage imageNamed:@"home_btn_timetable"];
    [timeTableBtn setBackgroundImage:timeTableImage forState:UIControlStateNormal];
    [headerView addSubview:timeTableBtn];
    
    //    设置tableview的头为横幅
    _tableView.tableHeaderView =headerView;
}

/**
 *  横幅自动滚动
 */
- (void)runningTimer
{
    NSInteger page = _scrollBanner.contentOffset.x/kScreenWidth;
    page++;
    _pageControl.currentPage = page;
    [_scrollBanner setContentOffset:CGPointMake(kScreenWidth*page, 0) animated:YES];
}

#pragma mark - 更新横幅图片

- (void)relayoutBannerWithArray:(NSArray *)imageArray
{
    
     [self.tableView.mj_header endRefreshing];
    /**
     *  从父视图移除按钮
     */
    NSArray *subs = [self.scrollBanner subviews];
    if (subs.count != 0) {
        for (UIView *button in subs) {
            [button removeFromSuperview];
        }
    }
    
    _bannerArray = [[NSMutableArray alloc]initWithArray:imageArray];
    _pageControl.numberOfPages = imageArray.count;
    
    //用于循环显示
    UIImageView *headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(-kScreenWidth , 0, kScreenWidth,_scrollBanner.bounds.size.height)];
    //取出模型
    BannerModel *header = [imageArray lastObject];
    NSURL *headerImageURL = [NSURL URLWithString:header.imageUrl];
    //添加图片
    [headerImageView sd_setImageWithURL:headerImageURL];
    //添加到滚动视图上
    [_scrollBanner addSubview:headerImageView];
    
    int index = 0;
    for (; index < imageArray.count; index++)
    {
        [self createBannerImageWithImageArray:imageArray Index:index];
    }
    
    //用于循环显示
    UIImageView *footerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth * index, 0, kScreenWidth,_scrollBanner.bounds.size.height)];
    //取出模型
    BannerModel *footer = [imageArray firstObject];
    NSURL *footerImageURL = [NSURL URLWithString:footer.imageUrl];
    //添加图片
    [footerImageView sd_setImageWithURL:footerImageURL];
    //添加到滚动视图上
    [_scrollBanner addSubview:footerImageView];
    
    //设置滚动视图的滚动范围
    [_scrollBanner setContentSize:CGSizeMake(kScreenWidth * (imageArray.count+2),_scrollBanner.bounds.size.height)];
}
/**
 *  创建横幅图片
 *
 *  @param imageArray 存储横幅的模型数据
 *  @param index      第几个图片
 */
- (void)createBannerImageWithImageArray:(NSArray *)imageArray Index:(NSInteger)index
{
    UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imageBtn.frame = CGRectMake(kScreenWidth * index, 0, kScreenWidth,_scrollBanner.bounds.size.height);
    [imageBtn setAdjustsImageWhenHighlighted:NO];
    imageBtn.tag = 1000 + index;
    
    BannerModel *banner = imageArray[index];
    NSURL *imageURL = [NSURL URLWithString:banner.imageUrl];
    //设置按钮的图片
    [imageBtn sd_setImageWithURL:imageURL forState:UIControlStateNormal];
    //将按钮添加到滚动视图上
    [_scrollBanner addSubview:imageBtn];
}
#warning  子类要重写
#pragma mark - UITableViewDataSource
/**
 *  返回段数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
/**
 *  返回每段的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
/**
 *  刷新cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    //    cell.textLabel.text = @"首页测试数据－－－－－";
    return cell;
}
#warning  子类要重写
#pragma mark - UITableViewDelegate
/**
 *  返回cell的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == _scrollBanner) {
        NSInteger page = scrollView.contentOffset.x/kScreenWidth;
        if (page == _bannerArray.count) {
            _pageControl.currentPage = 0;
            [scrollView setContentOffset:CGPointZero animated:NO];
            
        }else{
            _pageControl.currentPage = page;
        }
        
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (scrollView == _scrollBanner) {
        NSInteger page = scrollView.contentOffset.x/kScreenWidth;
        if (page == _bannerArray.count) {
            _pageControl.currentPage = 0;
            [scrollView setContentOffset:CGPointZero animated:NO];
        }else
        {
            _pageControl.currentPage = page;
        }
        
    }
}

#warning 没有实现向左拉也能循环
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView == _scrollBanner) {
        if (scrollView.contentOffset.x < 0) {
            [scrollView setContentOffset:CGPointMake(kScreenWidth*4, 0) animated:NO];
        }
    }
}



@end
