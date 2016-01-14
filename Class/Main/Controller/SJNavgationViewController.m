//
//  SJNavgationViewController.m
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import "SJNavgationViewController.h"

@interface SJNavgationViewController ()

@end

@implementation SJNavgationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    
  
}
/**
 *  当第一次调用这个类时使用1次
 */
+ (void)initialize
{
    [self setupNavigationBarTheme];
}

/**
 *  通过appearance一次性设置整个项目中的UINavigationBar的背景
 */
+ (void)setupNavigationBarTheme
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    // 设置导航栏背景
    [appearance setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
}

/**
 *  拦截所有push进来的子控制器
 *
 *  @param viewController push到的字控制器
 *  @param animated       push时是否有动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    if (self.viewControllers.count > 0) {
        // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    UIButton *userBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [userBtn setImage:[UIImage imageNamed:@"tabbar_btn_cyber_space_selected@3x"] forState:UIControlStateNormal];
    [userBtn setBackgroundColor:[UIColor cyanColor]];
    [userBtn.layer setCornerRadius:12.5];
    [userBtn setFrame:CGRectMake(0, 0, 25, 25)];
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:userBtn];
   
    [super pushViewController:viewController animated:animated];
    
}

@end
