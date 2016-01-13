//
//  DockView.m
//  sina
//
//  Created by 609972942 on 15/12/17.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "DockView.h"
#import "DockItem.h"

#define kDockHeight 44

@interface DockView ()

@property (nonatomic,strong) DockItem *recordItem;

@end


@implementation DockView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]]];
        
    }
    return self;
}

#pragma mark 动态添加Dockitem
/**
 *  动态添加Dockitem
 *
 *  @param icon         item的图标
 *  @param selectedIcon item的选中图标
 *  @param title        item的标题
 */
- (void)addDockItemWithIcon:(NSString *)icon andSelectedIcon:(NSString *)selectedIcon andTitle:(NSString *)title{
    
    DockItem *item = [[DockItem alloc]init];
    [item setTitle:title forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:selectedIcon] forState:UIControlStateSelected];
    [item addTarget:self action:@selector(buttonCilck:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:item];
    
    NSInteger subCount =self.subviews.count;
    
    if (subCount == 1) {
//      模拟点击第一个按钮
        [self buttonCilck:item];
    }
    
    CGFloat width = self.bounds.size.width / subCount;
    
    for (NSInteger i =0; i < subCount; i ++) {
        
        DockItem *dockItem = self.subviews[i];
        [dockItem setTag:i];
        [dockItem setFrame:CGRectMake(i * width, 0, width, kDockHeight)];
    }
    
}
/**
 *  监控协议方法是否被响应
 *
 *  @param item 选中的item
 */
- (void)buttonCilck:(DockItem *)item{
    
    if ([self.delegate respondsToSelector:@selector(dockView:dockItemForm:dockItemTo:)]) {
        
        [self.delegate dockView:self dockItemForm:self.recordItem.tag dockItemTo:item.tag];
        
    }
    
    [self.recordItem setSelected:NO];
    
    [item setSelected:YES];
    
    self.recordItem = item;
}

@end
