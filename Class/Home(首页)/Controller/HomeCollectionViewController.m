//
//  HomeCollectionViewController.m
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import "HomeCollectionViewController.h"
#import "URLConfig.h"
#import "RecommendCollectionViewCell.h"
#import "NewConllectionViewCell.h"
#import "ClassifyConllectionViewCell.h"
#import "AFNetworking.h"
#import "BannerModel.h"
#import "XinFanModel.h"
#import "FenQuModel.h"
#import "ClassifyModel.h"
#import "AnimationDetailViewController.h"

/**
 *  导航控制器的高度
 */
#define kNavigationBarHeight self.navigationController.navigationBar.bounds.size.height
/**
 *  屏幕宽度
 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface HomeCollectionViewController ()
/**
 *  纪录选中按钮
 */
@property (strong , nonatomic) UIButton *tempButton;
/**
 *  存储番组横幅模型信息
 */
@property (strong , nonatomic) NSMutableArray *newsBannerArray;
/**
 *  存储推荐横幅模型信息
 */
@property (strong , nonatomic) NSMutableArray *recBannerArray;
/**
 *  存储推荐本季新番信息
 */
@property (strong , nonatomic) NSMutableArray *xinFanArray;
/**
 *  存储推荐分区视频信息
 */
@property (strong , nonatomic) NSMutableArray *fenQuArray;
/**
 *  存储番组所有本季新番信息
 */
@property (strong , nonatomic) NSMutableArray *AllXinFanArray;
/**
 *  存储分区按钮的数据
 */
@property (strong , nonatomic) NSMutableArray *classifyArray;

@end

@implementation HomeCollectionViewController

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
    
    
    //注册复用池
    [self.collectionView registerClass:[NewConllectionViewCell class] forCellWithReuseIdentifier:@"NewConllectionViewCell"];
    [self.collectionView registerClass:[RecommendCollectionViewCell class] forCellWithReuseIdentifier:@"RecommendCollectionViewCell"];
    [self.collectionView registerClass:[ClassifyConllectionViewCell class] forCellWithReuseIdentifier:@"ClassifyConllectionViewCell"];
    
    [self createNavgationTitleView];
    
    [self getBannerData];
    [self getXinFanData];
    [self getFenQuVideoData];
    [self getAllXinFanData];
    [self getClassifyData];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //设置初始位置,放在viewDidLoad中因为collectionView还没有初始化成功所以设置失败
    [self.collectionView setContentOffset:CGPointMake(kScreenWidth, 0) animated:YES];
}
#pragma mark - 搭建界面
/**
 *  创建titleView
 */
- (void)createNavgationTitleView
{
    UIView *titleView =[[UIView alloc]init];
    [titleView setFrame:CGRectMake(0, 0, 150, kNavigationBarHeight)];
    [self createButtonInTitleView:titleView andIndex:0 andTitle:@"番组"];
    [self createButtonInTitleView:titleView andIndex:1 andTitle:@"推荐"];
    [self createButtonInTitleView:titleView andIndex:2 andTitle:@"分区"];
    
    self.navigationItem.titleView = titleView;
}
/**
 *  按钮的点击事件
 */
- (void)pressTitleButton:(UIButton *)button
{

    //判断点击的是否是以选中的按钮
    if (_tempButton != button){
        _tempButton.selected = !_tempButton.selected;
    }else{
        return;
    }
    
    //更改collectionView的显示位置
    NSInteger page = button.tag - 1000;
    [self.collectionView setContentOffset:CGPointMake(kScreenWidth*page, 0)];

    //纪录选中的按钮
    _tempButton = button;
    button.selected = !button.selected;
}
/**
 *  创建TitleView的按钮
 */
- (void)createButtonInTitleView:(UIView*)titleView andIndex:(NSInteger)index andTitle:(NSString *)title
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(50*index, 0,50, kNavigationBarHeight)];
    [button setTag:1000+index];
    if (index == 1) {
        button.selected = YES;
        _tempButton = button;
    }
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(pressTitleButton:) forControlEvents:UIControlEventTouchDown];
    [titleView addSubview:button];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x/kScreenWidth;
    NSArray *btnArray = self.navigationItem.titleView.subviews;
    
    for (UIButton *button in btnArray) {
        if (button.tag == 1000+page) {
            _tempButton = button;
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
    [self getBannerData];
}

#pragma mark - 获取数据
/**
 *  获取横幅数据
 */
- (void)getBannerData
{
    _newsBannerArray  = [[NSMutableArray alloc]initWithCapacity:0];
    _recBannerArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //设置返回数据类型
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    //获取番组横幅
    NSString *newURLString = [kNew_banner_URL stringByAppendingString:kTureParam];
    [manager GET:newURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //将流数据转换为字典
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
      
//        NSLog(@"%@",dic);
        
        //循环遍历字典拿到横幅模型数据
        for (NSDictionary *bannerDic in dic[@"featured_banner"]) {
            
            BannerModel *banner = [[BannerModel alloc]init];
            [banner setValuesForKeysWithDictionary:bannerDic];
            [_newsBannerArray addObject:banner];
            
        }
        [self.collectionView reloadData];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
    
    //获取推荐横幅
    NSString *recURLString = [kRecommend_banner_URL stringByAppendingString:kTureParam];
    [manager GET:recURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //将流数据转换为字典
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
//        NSLog(@"%@",dic);
        
        //循环遍历字典拿到横幅模型数据
        for (NSDictionary *bannerDic in dic[@"recommend_banner"]) {
            
            BannerModel *banner = [[BannerModel alloc]init];
            [banner setValuesForKeysWithDictionary:bannerDic];
            [_recBannerArray addObject:banner];
            
        }
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];

}
/**
 *  获取推荐新番数据
 */
- (void)getXinFanData
{
    _xinFanArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //设置返回数据类型
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *xinFanURLString = [kRecommend_XinFan_URL stringByAppendingString:kTureParam];
    [manager GET:xinFanURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //将流数据转换为数组
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    
        
        //循环遍历字典拿到横幅模型数据
        for (NSInteger index = 0; index < array.count; index++) {
            
            NSDictionary *dic = [array objectAtIndex:index];

            NSDictionary *animeDic = [dic objectForKey:@"anime"];
         
            XinFanModel *xinFan = [[XinFanModel alloc]init];
            [xinFan setValuesForKeysWithDictionary:animeDic];
            [_xinFanArray addObject:xinFan];
        }
    
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}
/**
 *  获取推荐分区数据
 */
- (void)getFenQuVideoData
{
    _fenQuArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //设置返回数据类型
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    NSString *fenQuURLString = [kRecommend_FenQu_URL stringByAppendingString:kTureParam];
    [manager GET:fenQuURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //将流数据转换为数组
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *fenQuDic in array) {
            
            FenQuModel *fenQuVideo = [[FenQuModel alloc]init];
            [fenQuVideo setValuesForKeysWithDictionary:fenQuDic];
            [_fenQuArray addObject:fenQuVideo];
        }
        
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
    
}
/**
 *  获取番组新番数据
 */
- (void)getAllXinFanData
{
    _AllXinFanArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //设置返回数据类型
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    NSString *allXinFanURLString = [kNew_AllXinFan_URL stringByAppendingString:kTureParam];
    
    [manager GET:allXinFanURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //将流数据转换为数组
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //循环遍历字典拿到横幅模型数据
        for (NSInteger index = 0; index < array.count; index++) {
            
            NSDictionary *dic = [array objectAtIndex:index];
            NSDictionary *animeDic = [dic objectForKey:@"anime"];
            
            XinFanModel *xinFan = [[XinFanModel alloc]init];
            [xinFan setValuesForKeysWithDictionary:animeDic];
            [_AllXinFanArray addObject:xinFan];
        }
        
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
/**
 *  获取分区按钮的数据
 */
- (void)getClassifyData
{
    _classifyArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //设置返回数据类型
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    NSString *classifyURLString = [kClassify_URL stringByAppendingString:kTureParam];
    
    [manager GET:classifyURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        NSDictionary *classifyDic = [dic objectForKey:@"result"];
        NSArray *classifyArray = [classifyDic objectForKey:@"categories"];
        
        for (NSDictionary *dataDic in classifyArray) {
            ClassifyModel *classify = [[ClassifyModel alloc]init];
            [classify setValuesForKeysWithDictionary:dataDic];
            [_classifyArray addObject:classify];
        }
        
        [self.collectionView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
/**
 *  获取动画详情数据
 */
- (void)getAnimationDetailDataWithAnimationID:(NSString *)animationID;
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //设置返回数据类型
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *animationDetailURLString = [NSString stringWithFormat:kAnimation_Detaile_URL,animationID,kTureParam];
    
    [manager GET:animationDetailURLString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *animationDic = [dic objectForKey:@"anime"];
        XinFanModel *xinFan = [[XinFanModel alloc]init];
        [xinFan setValuesForKeysWithDictionary:animationDic];
       
        AnimationDetailViewController *animationVC = [[AnimationDetailViewController alloc]init];
        
        animationVC.animation = xinFan;
        
        [self.navigationController pushViewController:animationVC animated:YES];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败");
    }];
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

-(void)testOnly
{
    NSLog(@"test");
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item == 0) {
        NewConllectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"NewConllectionViewCell" forIndexPath:indexPath];
        //刷新数据
        cell.refreshBlock = ^(){
            [self getAllXinFanData];
        };
        
        //刷新横幅数据
        if (_newsBannerArray.count != 0) {
            [cell relayoutBannerWithArray:_newsBannerArray];
        }
        if (_AllXinFanArray.count != 0) {
            [cell relayoutAllXinFanWithArray:_AllXinFanArray];
        }
        
        return cell;
    }else if (indexPath.item == 1){
        RecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RecommendCollectionViewCell" forIndexPath:indexPath];
        //刷新数据
        cell.refreshBlock = ^(){
            [self getBannerData];
            [self getFenQuVideoData];
        };
        //进入动画详情
        cell.enterAnmationDetail = ^(NSString *animationID){
            [self getAnimationDetailDataWithAnimationID:animationID];
        };
        
        //刷新横幅数据
        if (_recBannerArray.count != 0) {
            [cell relayoutBannerWithArray:_recBannerArray];
        }
        //刷新新番数据
        if (_xinFanArray.count != 0) {
            [cell setXinFanArray:_xinFanArray];
        }
        //刷新分区数据
        if (_fenQuArray.count != 0) {
            [cell setFenQuArray:_fenQuArray];
        }
        return cell;
    }
    ClassifyConllectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ClassifyConllectionViewCell" forIndexPath:indexPath];
    if (_classifyArray.count != 0) {
        [cell setClassifyArray:_classifyArray];
        [cell relayoutDataWithArray:_classifyArray];
    }
    return cell;
}

- (void)nslog
{
    NSLog(@"afsdfads");
}

@end
