//
//  XinFanTableViewCell.m
//  pudding
//
//  Created by 千锋 on 16/1/4.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "XinFanTableViewCell.h"
#import "XinFanButton.h"
#import "XinFanModel.h"
#import "UIButton+WebCache.h"
@interface XinFanTableViewCell ()<UIScrollViewDelegate>

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

/**
 *  本季新番
 */
@property (strong , nonatomic) UIScrollView *scrollXinFan;

@property (strong , nonatomic) NSArray *xinFanArray;

@end

@implementation XinFanTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //创建UI
        [self createUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor colorWithRed:231.0f green:231.0f blue:231.0f alpha:231.0f];
    }
    return self;
}

/**
 *  创建UI
 */
- (void)createUI
{
    
    UILabel *titleLale = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, kScreenWidth, 15)];
    [titleLale setText:@"本季新番"];
    [titleLale setFont:[UIFont systemFontOfSize:12]];
    [self.contentView addSubview:titleLale];
    
    _scrollXinFan = [[UIScrollView alloc]initWithFrame:CGRectMake(10,30, kScreenWidth-20, 100)];
//    隐藏滚动条
    _scrollXinFan.showsHorizontalScrollIndicator = NO;
    _scrollXinFan.showsVerticalScrollIndicator = NO;
//    禁止弹性滑动
    _scrollXinFan.bounces = NO;
//    设置代理
    _scrollXinFan.delegate = self;
    [self.contentView addSubview:_scrollXinFan];
}

- (void)relayoutXinFanWithArray:(NSArray *)xinFanArray
{
    /**
     *  从父视图移除按钮
     */
    NSArray *subs = [self.scrollXinFan subviews];
    if (subs.count != 0) {
        for (UIView *button in subs) {
            [button removeFromSuperview];
        }
    }
    
    _xinFanArray = [[NSArray alloc]initWithArray:xinFanArray];
    
    NSInteger count = xinFanArray.count;
    //根据数组的个数动态创建XinFanButton
    for (NSInteger i = 0; i < count; i++) {
        
        //从数组中拿出新番数据
        XinFanModel *xinFan = xinFanArray[i];
        XinFanButton *button = [[XinFanButton alloc]init];
        [button setTag:100+i];
        [button setNewVideoNumber:xinFan.onairEpNumber];
        [button setTitle:xinFan.name forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        NSURL *imageURL = [NSURL URLWithString:xinFan.image.url];
        [button sd_setImageWithURL:imageURL forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(EnterAnimationDetailWithButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [button setFrame:CGRectMake(80*i, 0, 70, 100)];
        
        [self.scrollXinFan addSubview:button];
        
    }
    [self.scrollXinFan setContentSize:CGSizeMake(80*count, 0)];
    
}

- (void)EnterAnimationDetailWithButton:(XinFanButton *)button
{
    XinFanModel *xinFan = _xinFanArray[button.tag-100];
    self.enterAnmationDetail(xinFan._id);
}





@end
