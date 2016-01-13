//
//  DockView.h
//  sina
//
//  Created by 609972942 on 15/12/17.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DockView;

@protocol DockViewDelegate <NSObject>

@optional
//  代理方法
- (void)dockView:(DockView *)dockView dockItemForm:(NSInteger)from dockItemTo:(NSInteger)to;

@end

@interface DockView : UIView

@property (nonatomic,assign) id <DockViewDelegate>delegate;

- (void)addDockItemWithIcon:(NSString *)icon andSelectedIcon:(NSString *)selectedIcon andTitle:(NSString *)title;

@end
