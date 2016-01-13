//
//  SJTabBarViewController.m
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import "SJTabBarViewController.h"
#import "SJNavgationViewController.h"
#import "HomeCollectionViewController.h"
#import "TimeLineCollectionViewController.h"
#import "SecondWorldViewController.h"
#import "ElectricWaveViewController.h"

#define SCREENSIZE [UIScreen mainScreen].bounds.size
#define SCREENSIZEWIDTH SCREENSIZE.width
#define SCREENSIZEHEIGHT SCREENSIZE.height
#define kNavgationHeight 64
#define kTabBarHeight self.tabBar.bounds.size.height
@interface SJTabBarViewController ()

@end

@implementation SJTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addAllChildVC];
    
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
   
}

- (void)addAllChildVC
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //设置每个元素的大小
    layout.itemSize = CGSizeMake(SCREENSIZEWIDTH, SCREENSIZEHEIGHT - kNavgationHeight - kTabBarHeight);
    //设置滑动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置每个元素的水平间距
    layout.minimumLineSpacing = 0;
    
    //    建立主世界
    HomeCollectionViewController *home = [[HomeCollectionViewController alloc]initWithCollectionViewLayout:layout];
    [self addOneChlildVc:home title:nil imageName:@"tabbar_btn_new_normal" selectedImageName:@"tabbar_btn_new_selected"];
    
    //    掌控时间线
    TimeLineCollectionViewController *time = [[TimeLineCollectionViewController alloc]initWithCollectionViewLayout:layout];
    [self addOneChlildVc:time title:nil imageName:@"tabbar_btn_timeline_normal" selectedImageName:@"tabbar_btn_timeline_selected"];
   
    //    铸造二次元
    SecondWorldViewController *second = [[SecondWorldViewController alloc]init];
    [self addOneChlildVc:second title:nil imageName:@"tabbar_btn_cyber_space_normal" selectedImageName:@"tabbar_btn_cyber_space_selected"];
    //    链接电波
    ElectricWaveViewController *wave = [[ElectricWaveViewController alloc]init];
    [self addOneChlildVc:wave title:nil imageName:@"tabbar_btn_wave_normal" selectedImageName:@"tabbar_btn_wave_selected"];
    
}

- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    // 相当于同时设置了tabBarItem.title和navigationItem.title
    childVc.navigationItem.title = title;
    
    UIImage *image =  [UIImage imageNamed:imageName];

    // 设置图标
    childVc.tabBarItem.image = image;
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed
                              :selectedImageName];
    // 声明这张图片用原图(别渲染)
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    //设置图片的偏移量
    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
     //self.tabBarItem.imageInsets =
    // 添加为tabbar控制器的子控制器
    SJNavgationViewController *nav = [[SJNavgationViewController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
  
}


@end
