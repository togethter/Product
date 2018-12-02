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


+ (instancetype)scrollManagerWithContentView:(UIView *)contentView withParentController:(UIViewController *)parentViewController withConfi:(ScrollowConfig *)config;// 指定初始化方法
- (void)addChilder:(UIViewController *)childerViewController title:(NSString *)title;// 添加自试图控制器

- (instancetype (^)(UIView *contentView ,UIViewController *parentViewController, ScrollowConfig *config))parentViewController;// 配置父试图
- (instancetype (^)(UIViewController *vc, NSString *title))addChildren;// 添加子试图控制器
- (void)show;//展示

   
@end

NS_ASSUME_NONNULL_END
