//
//  AnimationDetailViewController.m
//  pudding
//
//  Created by 千锋 on 16/1/13.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "AnimationDetailViewController.h"


#define kScreenBounds [UIScreen mainScreen].bounds
@interface AnimationDetailViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation AnimationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //    注册复用池
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    //    将tableView添加到cell上
    [self.view addSubview:_tableView];
}

#pragma mark - UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}

@end
