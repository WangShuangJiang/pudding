//
//  ClassifyConllectionViewCell.m
//  pudding
//
//  Created by 千锋 on 15/12/31.
//  Copyright (c) 2015年 King王双江. All rights reserved.
//

#import "ClassifyConllectionViewCell.h"
#import "ClassifyButton.h"
#import "ClassifyModel.h"
#import "UIButton+WebCache.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ClassifyConllectionViewCell ()<UIScrollViewDelegate>
/**
 *  内容详情
 */
@property (strong , nonatomic) UIScrollView *scrollView;

@property (strong , nonatomic) UIView *animationView;
@property (strong , nonatomic) UIView *amuseView;

@end

@implementation ClassifyConllectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        [self createUI];
    }
    return self;
}

- (void)setClassifyArray:(NSMutableArray *)classifyArray
{
    if (_classifyArray == nil) {
        _classifyArray = [[NSMutableArray alloc]initWithArray:classifyArray];
        [self createUI];
    }
}

/**
 *  创建UI
 */
- (void)createUI
{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, self.contentView.bounds.size.height)];
    _scrollView.backgroundColor = [UIColor colorWithRed:232.0f/256.0f green:240.0f/256.0f blue:240.0f/256.0f alpha:0.8];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    
    [self.contentView addSubview:_scrollView];
    
    UILabel *animation = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    animation.text = @"  动画";
    animation.textColor = [UIColor blackColor];
    animation.backgroundColor = [UIColor colorWithRed:232.0f/256.0f green:240.0f/256.0f blue:240.0f/256.0f alpha:0.8];
    animation.font = [UIFont systemFontOfSize:15];
    [_scrollView addSubview:animation];
    
    _animationView = [[UIView alloc]init];
    _animationView.backgroundColor = [UIColor colorWithRed:232.0f/256.0f green:240.0f/256.0f blue:240.0f/256.0f alpha:0.8];
    /**
     *  根据数组的个数创建button
     */
    ClassifyModel *aniClassify = _classifyArray[0];
    
    CGFloat animationHeight = [self createClassifyButtonWithNumber:aniClassify.children.count andSuperView:_animationView];
    [_animationView setFrame:CGRectMake(0, 40, kScreenWidth, animationHeight)];
    
    
    UILabel *amuse = [[UILabel alloc]initWithFrame:CGRectMake(0, _animationView.frame.origin.y + _animationView.bounds.size.height, kScreenWidth, 40)];
    amuse.text = @"  娱乐";
    amuse.textColor = [UIColor blackColor];
    amuse.backgroundColor = [UIColor colorWithRed:232.0f/256.0f green:240.0f/256.0f blue:240.0f/256.0f alpha:0.8];
    amuse.font = [UIFont systemFontOfSize:15];
    [_scrollView addSubview:amuse];
    
    _amuseView = [[UIView alloc]init];
    _amuseView.backgroundColor = [UIColor colorWithRed:232.0f/256.0f green:240.0f/256.0f blue:240.0f/256.0f alpha:0.8];
    
    /**
     *  根据数组的个数创建button
     */
    ClassifyModel *amuClassify = _classifyArray[1];
    
    CGFloat amuseHeight = [self createClassifyButtonWithNumber:amuClassify.children.count andSuperView:_amuseView];
    [_amuseView setFrame:CGRectMake(0, amuse.frame.origin.y + amuse.bounds.size.height, kScreenWidth, amuseHeight)];
    
    UIView *footer = [[UIView alloc]init];
    footer.backgroundColor = [UIColor colorWithRed:232.0f/256.0f green:240.0f/256.0f blue:240.0f/256.0f alpha:0.8];
    
    UIButton *sender = [UIButton buttonWithType:UIButtonTypeCustom];
    [sender setFrame:CGRectMake(10, 20 , kScreenWidth-20, 30)];
    [sender setTitle:@"投稿" forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sender setBackgroundColor:[UIColor colorWithRed:34.0f/256.0f green:175.0f/256.0f blue:252.0f/256.0f alpha:0.8]];
    [footer addSubview:sender];
    
    [footer setFrame:CGRectMake(0, _amuseView.frame.origin.y+_amuseView.bounds.size.height, kScreenWidth, 60)];
    [_scrollView addSubview:footer];
    
    [_scrollView addSubview:_animationView];
    [_scrollView addSubview:_amuseView];
    [_scrollView setContentSize:CGSizeMake(kScreenWidth, footer.frame.origin.y + footer.bounds.size.height)];
}

/**
 *   创建按钮
 */
- (CGFloat)createClassifyButtonWithNumber:(NSInteger)number andSuperView:(UIView *)superView
{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = kScreenWidth/3;
    CGFloat height = width;
    
    for (NSInteger i = 0; i < number; i++) {
        if (x+width > kScreenWidth) {
            x = 0;
            y += height;
        }
        ClassifyButton * button = [[ClassifyButton alloc]initWithFrame:CGRectMake(x, y, width, height)];
        [button setTag:i];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [button.layer setBorderWidth:0.25f];
        [button.layer setBorderColor:[UIColor colorWithRed:233.0f/256.0f green:233.0f/256.0f blue:233.0f/256.0f alpha:1].CGColor];
        x += width;
        [superView addSubview:button];
    }
    
    return y + height;
}

- (void)relayoutDataWithArray:(NSArray *)classifyArray
{
    
    NSArray *animationSubs = [_animationView subviews];
    NSArray *amuseSubs = [_amuseView subviews];
    NSInteger count;
    NSArray *array;
    for (NSInteger i = 0; i < classifyArray.count; i++) {
        
        if (i == 0) {
            count = animationSubs.count;
            array = animationSubs;
        }else{
            count = amuseSubs.count;
            array = amuseSubs;
        }
        
        ClassifyModel *classify = classifyArray[i];
        
        for (NSInteger j = 0; j < count; j++) {
            
            ClassifyButton *button = array[j];
            NSDictionary *dic = classify.children[j];
            Children *children = [Children childrenWithDictiony:dic];
            
            [button setTitle:children.name forState:UIControlStateNormal];
            NSURL *url = [NSURL URLWithString:children.icon];
            [button sd_setImageWithURL:url forState:UIControlStateNormal];
            
        }
        
    }
}


@end
