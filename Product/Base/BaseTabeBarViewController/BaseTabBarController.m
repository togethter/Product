//
//  BaseTabBarController.m
//  Product
//
//  Created by GD on 2020/6/29.
//  Copyright © 2020 李学良. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "HomeController.h"
#import "MineController.h"
#import "TalkViewController.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor hex:@"#FFBE72"]} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor hex:@"#9B9B9B"]} forState:UIControlStateNormal];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kScreenWidth == 320 ? 15 : 17]}];
    [[UINavigationBar appearance] setTintColor:[UIColor hex:@"#FFBE72"]];
    
    
    HomeController *home = [[HomeController alloc] init];
    TalkViewController *date = [[TalkViewController alloc] init];
    MineController *mine = [[MineController alloc] init];
    [self addChildViewController:home title:@"首页" normalImgStr:@"_ic_tabbar_home_s" selectImgStr:@"_ic_tabbar_home_n"];
    [self addChildViewController:date title:@"日期" normalImgStr:@"04TABbar_s" selectImgStr:@"04TABbar_n"];
    [self addChildViewController:mine title:@"我的" normalImgStr:@"05TABbar_s" selectImgStr:@"05TABbar_n"];
}

- (void)addChildViewController:(UIViewController *)childController
                         title:(NSString *)title
                     normalImgStr:(NSString *)normalImgStr
                     selectImgStr:(NSString *)selectImgStr {
    UIImage *normalImg = [UIImage imageNamed:normalImgStr];
    UIImage *selectImg = [UIImage imageNamed:selectImgStr];
    normalImg = [normalImg imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    selectImg = [selectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.navigationItem.title = title;
    childController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImg selectedImage:selectImg];
    if (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
//        childController.tabBarItem.imageInsets = UIEdgeInsetsMake(0,0,6,0);
    }
    [self addChildViewController: [[BaseNavigationController alloc] initWithRootViewController:childController]];
}


#pragma mark - Method
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.selectedViewController) {
        return self.selectedViewController.preferredStatusBarStyle;
    }
    return UIStatusBarStyleLightContent;
}

@end
