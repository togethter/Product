//
//  BaseNavigationController.m
//  XianYou
//
//  Created by YangF on 2019/4/2.
//  Copyright © 2019 NianHuan. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id target = self.interactivePopGestureRecognizer.delegate;
    
    SEL handler = NSSelectorFromString(@"handleNavigationTransition:");
    UIView *targetView = self.interactivePopGestureRecognizer.view;
    UIPanGestureRecognizer * fullScreenGes = [[UIPanGestureRecognizer alloc]initWithTarget:target action:handler];
    fullScreenGes.delegate = self;
    [targetView addGestureRecognizer:fullScreenGes];
    [self.interactivePopGestureRecognizer setEnabled:NO];

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    if ([[self valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO;
    }
    
    return self.childViewControllers.count == 1 ? NO : YES;
}

@end

const char kDisablePopGesture;
@implementation UINavigationController (Category)
#pragma mark - Method

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.topViewController) {
        return self.topViewController.preferredStatusBarStyle;
    }
    return UIStatusBarStyleLightContent;
}
- (void)barStyle:(UNavigationBarStyle)barStyle {
    switch (barStyle) {
        case theme:
            self.navigationBar.barStyle = UIBarStyleBlack;
            [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:(UIBarMetricsDefault)];
            self.navigationBar.shadowImage = [[UIImage alloc] init];
            
            break;
        case clear:
            self.navigationBar.barStyle = UIBarStyleBlack;
            [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:(UIBarMetricsDefault)];
            self.navigationBar.shadowImage = [[UIImage alloc] init];
            break;
        case white:
            
            self.navigationBar.barStyle = UIBarStyleDefault;
            [self.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor] forBarMetrics:(UIBarMetricsDefault)];
            self.navigationBar.shadowImage = nil;
            break;
        default:
            break;
    }
}

- (BOOL)disablePopGesture {
   return [objc_getAssociatedObject(self, &kDisablePopGesture) boolValue];
}
- (void)setDisablePopGesture:(BOOL)disablePopGesture {
    objc_setAssociatedObject(self, &kDisablePopGesture, @(disablePopGesture), OBJC_ASSOCIATION_ASSIGN);
}
@end
