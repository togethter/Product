//
//  NHBaseNavigationController.h
//  XianYou
//
//  Created by YangF on 2019/4/2.
//  Copyright © 2019 NianHuan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    theme = 1,
    clear = 2,
    white = 3,
} UNavigationBarStyle;

NS_ASSUME_NONNULL_BEGIN

@interface BaseNavigationController : UINavigationController

@end
@interface UINavigationController (Category)
//NavigationBarStyle 导航条的风格
- (void)barStyle:(UNavigationBarStyle)barStyle;
@property (nonatomic,assign) BOOL disablePopGesture;
@end
NS_ASSUME_NONNULL_END
