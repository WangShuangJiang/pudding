//
//  FenQuTableViewCell.m
//  pudding
//
//  Created by 千锋 on 16/1/8.
//  Copyright (c) 2016年 King王双江. All rights reserved.
//

#import "FenQuTableViewCell.h"
#import "FenQuButton.h"
#import "FenQuModel.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface FenQuTableViewCell ()

{
    //cell头部
    UIImageView *_fenQuImage;
    UILabel *_titleLale;
    UIButton *_moreButton;
    
    //cell的正文
    UIView *_contextView;
    
    //cell的尾部
    UIButton *_footerButton;
}

@end

@implementation FenQuTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor colorWithRed:218.0f green:218.0f blue:218.0f alpha:0.7];
    }
    return self;
}

- (void)createUI
{
    //分区cell的头
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 25)];
    
    UIImageView *fenQuImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 20, 15)];
    [fenQuImage setContentMode:UIViewContentModeScaleAspectFill];
    _fenQuImage = fenQuImage;
    [headerView addSubview:fenQuImage];
    
    UILabel *titleLale = [[UILabel alloc]init];
    [titleLale setFont:[UIFont systemFontOfSize:9]];
    [titleLale setFrame:CGRectMake(30, 5, 100, 15)];
    _titleLale = titleLale;
    [headerView addSubview:titleLale];
    
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [moreButton setFrame:CGRectMake(kScreenWidth-60, 5, 50, 20)];
//    [moreButton setImage:[UIImage imageNamed:@"home_icon_category_ep_more"] forState:UIControlStateNormal];
//    [moreButton setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 0, -15)];
//    [moreButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 30)];
    [moreButton setTitle:@"查看更多" forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [moreButton.titleLabel setFont:[UIFont systemFontOfSize:10]];
    _moreButton = moreButton;
    [headerView addSubview:moreButton];
    
    [self.contentView addSubview:headerView];
    
    //分区内容详情
    UIView *contextView = [[UIView alloc]initWithFrame:CGRectMake(0, 25, self.contentView.bounds.size.width, 250)];
     _contextView = contextView;
    
    //cell每次复用时重新创建一次contextButton
    CGFloat x = 10;
    CGFloat y = 0;
    CGFloat width = (kScreenWidth-30)/2;
    CGFloat height = 120;
    
    for (NSInteger i  = 0; i < 4; i++) {
        
        FenQuButton *button = [[FenQuButton alloc]init];
        [button setTag:i];
        if (i>1) {
            y = height+10;
        }
        if (i>1) {
            if (i == 2) {
                [button setFrame:CGRectMake(x, y, width, height)];
            }else{
                [button setFrame:CGRectMake(x+width+10, y, width, height)];
            }
        }else{
            [button setFrame:CGRectMake(x+i*(width+10),y,width,height)];
        }
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
        
        [_contextView addSubview:button];
    }

    [self.contentView addSubview:_contextView];
   
    //尾部
    UIButton *footerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerButton setFrame:CGRectMake(0, 0, 120, 20)];
    [footerButton.layer setCornerRadius:15];
    [footerButton setBackgroundColor:[UIColor colorWithWhite:0.6 alpha:0.1]];
    [footerButton setCenter:CGPointMake(kScreenWidth/2, 290)];
    
    [footerButton setImage:[UIImage imageNamed:@"home_icon_category_ep_refresh"] forState:UIControlStateNormal];
    [footerButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [footerButton setTitle:@"召唤一组新推荐" forState:UIControlStateNormal];
    [footerButton.titleLabel setFont:[UIFont systemFontOfSize:10]];
    [footerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _footerButton = footerButton;
    [self.contentView addSubview:footerButton];
}

- (void)relayoutFenQuDataWithArray:(FenQuModel *)fenQu
{

    NSURL *fenQuHeaderImageURL = [NSURL URLWithString:fenQu.icon];
    [_fenQuImage sd_setImageWithURL:fenQuHeaderImageURL];
    
    [_titleLale setText:fenQu.name];
    
    NSArray *array = [_contextView subviews];
    
    for (NSInteger i = 0; i < 4; i++) {
        FenQuButton *button = [array objectAtIndex:i];
        NSDictionary *epsDic = [fenQu.eps objectAtIndex:i];
        Eps *eps = [Eps epsWithDictiony:epsDic];
        
        [button setTitle:eps.title forState:UIControlStateNormal];
        [button setPlayCount:eps.playCount];
        NSURL *videoImageURL = [NSURL URLWithString:eps.image.url];
        [button sd_setImageWithURL:videoImageURL forState:UIControlStateNormal];
    }
    

}


@end
