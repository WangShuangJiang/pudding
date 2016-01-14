//
//  AnimationDetailViewController.m
//  pudding
//
//  Created by 千锋 on 16/1/13.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "AnimationDetailViewController.h"
#import "BriefTableViewCell.h"
#import "AniCountTableViewCell.h"
#import "AFNetworking.h"
#import "XinFanModel.h"
#define kScreenBounds [UIScreen mainScreen].bounds

@interface AnimationDetailViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation AnimationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self createBackItem];
    [self createUI];
}

/**
 *  创建返回按钮
 */
- (void)createBackItem
{
    self.navigationItem.title = @"动画详情";
    //禁止图片渲染
    UIImage *image = [[UIImage imageNamed:@"navigationbar_back_highlighted"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(back)];
}

/**
 *  返回事件
 */
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createUI
{
    
    
    //    创建tableView
    _tableView = [[UITableView alloc]initWithFrame:kScreenBounds];
    //    设置代理
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //    隐藏滚动条
    _tableView.showsVerticalScrollIndicator = NO;
    //    隐藏分割线
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //    将tableView添加到cell上
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDataSource
/**
 *  返回段数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
/**
 *  返回每段的行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 2;
    }
    return 10;
}
/**
 *  刷新cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
                cell.textLabel.text = _animation.name;
            }
            return cell;
        }else{
            BriefTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BriefTableViewCell"];
            if (cell == nil) {
                 cell = [[BriefTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BriefTableViewCell"];
                [cell relayoutWithAnimation:_animation];
            }
            return cell;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"UITableViewCell"];
                cell.textLabel.text = [NSString stringWithFormat:@"更新到%ld话",(long)_animation.onairEpNumber];
                [cell.textLabel setFont:[UIFont systemFontOfSize:15]];
                cell.detailTextLabel.text = _animation.onairRuleDescription;
            }
            return cell;
        }else{
            AniCountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AniCountTableViewCell"];
            if (cell == nil) {
                cell = [[AniCountTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AniCountTableViewCell"];
                [cell relayoutAnimationCountWithAnimation:_animation];
            }
            return cell;
        }
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate

/**
 *  返回cell的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
           
            return 20;
            
        }else{
            
            return 130;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
         
            return 20;
            
        }else{
            
            return 90;
        }
    }
    return 80;
}




@end
