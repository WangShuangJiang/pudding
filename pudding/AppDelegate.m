//
//  AppDelegate.m
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import "AppDelegate.h"
#import "SJTabBarViewController.h"
#import "MainViewController.h"
#import "YRSideViewController.h"
#import "SJLoginViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor =  [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    //滑动视图控制器
    _sideViewController = [[YRSideViewController alloc]init];
    //主界面视图
    SJTabBarViewController *sjTabVC = [[SJTabBarViewController alloc]init];
    //设置滑动视图的主视图
    _sideViewController.rootViewController = sjTabVC;
    
    //左视图
    SJLoginViewController *loginVC = [[SJLoginViewController alloc]init];
    _sideViewController.leftViewController = loginVC;
    
    _sideViewController.needSwipeShowMenu = YES;//默认开启的可滑动展示
    _sideViewController.showBoundsShadow = YES;
    _window.rootViewController = _sideViewController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
