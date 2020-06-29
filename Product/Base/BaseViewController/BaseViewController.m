//
//  BaseViewController.m
//  Product
//
//  Created by is on 2019/5/15.
//  Copyright © 2019 李学良. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
+ (void)load {
#ifdef DEBUG
    //原本的viewWillAppear方法
    Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
    //需要替换成 能够输出日志的viewWillAppear
    Method logViewWillAppear = class_getInstanceMethod(self, @selector(logViewWillAppear:));
    //两方法进行交换
    method_exchangeImplementations(viewWillAppear, logViewWillAppear);
    
#endif
}
- (void)logViewWillAppear:(BOOL)animated {
    NSString *className = NSStringFromClass([self class]);
    //在这里，你可以进行过滤操作，指定哪些viewController需要打印，哪些不需要打印
    if ([className hasPrefix:@"UI"] == NO) {
        DLog(@"%@ will appear",className);
    }
    //下面方法的调用，其实是调用viewWillAppear
    [self logViewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if(@available(iOS 11.0, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = false;
    }
    [self configUI];
    
}
#pragma mark - Method
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configNavigationBar];
    
}

- (void)configNavigationBar {
    UINavigationController *navi = self.navigationController;
    if ([navi.visibleViewController isEqual:self]) {
        [navi barStyle:(theme)];
        navi.disablePopGesture = NO;
        [navi setNavigationBarHidden:NO animated:YES];
        if (navi.viewControllers.count > 1) {
            navi.navigationItem.hidesBackButton = YES;
            UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:(UIBarButtonItemStylePlain) target:self action:@selector(backAction)];
            navi.navigationItem.leftBarButtonItem = leftBarBtn;
        }
        
    }
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)configUI {
    
}

@end
