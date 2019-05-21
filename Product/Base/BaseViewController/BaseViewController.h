//
//  BaseViewController.h
//  Product
//
//  Created by is on 2019/5/15.
//  Copyright © 2019 李学良. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
// 是否显示navigatinBar
- (BOOL)isNavigatinBarVisible;
// 是否显示sttusBar
- (BOOL)isStatusBarVisible;
// 配置导航条
- (void)configNavigationBar;
#pragma mark - 子类重载
- (void)doKeyboardChangeWithTransition:(YYKeyboardTransition)transition;// 键盘事件

- (void)doRightNavBarRightBtnAction;// 导航栏右键事件

- (void)doAccountBeKicked;// 账号被踢事件

@end

NS_ASSUME_NONNULL_END
