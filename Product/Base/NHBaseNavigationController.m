//
//  NHBaseNavigationController.m
//  XianYou
//
//  Created by YangF on 2019/4/2.
//  Copyright © 2019 NianHuan. All rights reserved.
//

#import "NHBaseNavigationController.h"

@interface NHBaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation NHBaseNavigationController

+ (void)load {
    
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithHexString:kTabbarNormalColor]} forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithHexString:kTabbarSelectedColor]} forState:UIControlStateSelected];
////    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:KScreenWidth == 320 ? 15 : 17]}];
//    [[UINavigationBar appearance] setTintColor:[UIColor colorWithHexString:kTabbarSelectedColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setTranslucent:NO];
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
        viewController.navigationController.navigationItem.hidesBackButton = YES;
        UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:(UIBarButtonItemStylePlain) target:self action:@selector(backAction)];
        viewController.navigationItem.leftBarButtonItem = leftBarBtn;
    }
    [super pushViewController:viewController animated:animated];
}


- (void)backAction {
    [self popViewControllerAnimated:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    
//    for (UIViewController *viewController in self.blackList) {
//        if ([self topViewController] == viewController) {
//            return NO;
//        }
//    }
    
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
