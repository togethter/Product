//
//  ScrollowManager.h
//  Product
//
//  Created by 李学良 on 2018/11/29.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifndef ScrollowConfig
#import "ScrollowConfig.h"
#endif
NS_ASSUME_NONNULL_BEGIN
@interface ScrollowManager : UIView

/**
 指定初始化方法

 @param contentView 父试图
 @param parentViewController 父试图控制器
 @param config 配置对象
 @return 分段管理器
 */
+ (instancetype)scrollManagerWithContentView:(UIView*)contentView
        withParentController:(UIViewController*)parentViewController
                   withConfi:(ScrollowConfig*)config;
/**
 添加子控制器

 @param childerViewController 子控制器
 @param title 分段标题
 */
- (void)addChilder:(UIViewController*)childerViewController
             title:(NSString*)title;
/**
添加子控制器

 @param childerViewControllerArray 控制器数组
 @param titleArray 分段标题数组
 */
- (void)addChilders:(NSArray *)childerViewControllerArray titles:(NSArray *)titleArray;
/**
 初始化方法
 */
- (instancetype (^)(UIView* contentView, UIViewController* parentViewController,
                    ScrollowConfig* config))parentViewController;
/**
 添加子控制器
 */
- (instancetype (^)(UIViewController* vc,
                    NSString* title))addChildren;
/**
 展示控件
 */
- (void)show;
/** 滑动到第几个下表*/
- (void)scrowIndex:(NSInteger)scrowIndex;

@end

NS_ASSUME_NONNULL_END
