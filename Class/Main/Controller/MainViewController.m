//
//  MainViewController.m
//  studyExchangePlatform
//
//  Created by 千锋 on 15/12/23.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import "MainViewController.h"
#import "DockView.h"
#import "SJNavgationViewController.h"
#import "HomeCollectionViewController.h"
#import "TimeLineCollectionViewController.h"
#import "SecondWorldViewController.h"
#import "ElectricWaveViewController.h"

#define SCREENSIZE [UIScreen mainScreen].bounds.size
#define SCREENSIZEWIDTH SCREENSIZE.width
#define SCREENSIZEHEIGHT SCREENSIZE.height
#define kDockHeight 44
#define kNavgationHeight 64

@interface MainViewController ()<DockViewDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //先给数组添加元素
    [self addSubViewControllers];
    //在创建自定义的tabBar
    [self createDockView];
    
}

#pragma mark - 创建子视图控制器
- (void)addSubViewControllers
{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //设置每个元素的大小
    layout.itemSize = CGSizeMake(SCREENSIZEWIDTH, SCREENSIZEHEIGHT - kDockHeight - kNavgationHeight);
    //设置滑动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置每个元素的水平间距
    layout.minimumLineSpacing = 0;
    
    //    建立主世界
    HomeCollectionViewController *home = [[HomeCollectionViewController alloc]initWithCollectionViewLayout:layout];
    SJNavgationViewController *homeNav = [[SJNavgationViewController alloc]initWithRootViewController:home];
    [self addChildViewController:homeNav];
    
    //    掌控时间线
    TimeLineCollectionViewController *time = [[TimeLineCollectionViewController alloc]initWithCollectionViewLayout:layout];
    SJNavgationViewController *timeNav = [[SJNavgationViewController alloc]initWithRootViewController:time];
    [self addChildViewController:timeNav];
  
    //    铸造二次元
    SecondWorldViewController *second = [[SecondWorldViewController alloc]init];
    SJNavgationViewController *secondNav = [[SJNavgationViewController alloc]initWithRootViewController:second];
    [self addChildViewController:secondNav];
    
    //    链接电波
    ElectricWaveViewController *wave = [[ElectricWaveViewController alloc]init];
    SJNavgationViewController *waveNav = [[SJNavgationViewController alloc]initWithRootViewController:wave];
    [self addChildViewController:waveNav];
 
}

#pragma mark - 创建自定义的tabBarViewController
- (void)createDockView
{
    DockView *dockView = [[DockView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height - kDockHeight, self.view.bounds.size.width, kDockHeight)];
    [dockView setDelegate:self];

    //动态添加item
    [dockView addDockItemWithIcon:@"tabbar_btn_new_normal" andSelectedIcon:@"tabbar_btn_new_selected" andTitle:nil];
    [dockView addDockItemWithIcon:@"tabbar_btn_timeline_normal" andSelectedIcon:@"tabbar_btn_timeline_selected" andTitle:nil];
    [dockView addDockItemWithIcon:@"tabbar_btn_cyber_space_normal" andSelectedIcon:@"tabbar_btn_cyber_space_selected" andTitle:nil];
    [dockView addDockItemWithIcon:@"tabbar_btn_wave_normal" andSelectedIcon:@"tabbar_btn_wave_selected" andTitle:nil];
    
    //将自定义的tabbar添加到视图控制器上
    [self.view addSubview:dockView];
}
#pragma mark - 用于切换的视图控制器
- (void)dockView:(DockView *)dockView dockItemForm:(NSInteger)from dockItemTo:(NSInteger)to
{
    //拿到要不要显示的视图控制器
    UIViewController *oldViewController = self.childViewControllers[from];
    //从主视图控制器上移除
    [oldViewController.view removeFromSuperview];
    
    //拿到想要显示的视图控制器
    UIViewController *newViewController = self.childViewControllers[to];
    //设置frame
    [newViewController.view setFrame:CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, self.view.bounds.size.height - kDockHeight)];
    [self.view addSubview:newViewController.view];
}

@end
