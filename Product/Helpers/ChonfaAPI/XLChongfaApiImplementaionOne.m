//
//  XLChongfaApiImplementaionOne.m
//  chongfa
//
//  Created by bilin on 2017/12/19.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import "XLChongfaApiImplementaionOne.h"
//#import "XLThirdPartyLoginViewController.h"// 第三方登录
//#import "BXTabBarController.h"// 用户端
//#import "LawyerBXTabBarController.h"// 律师端
//#import "NnwLawyerCertificationViewController.h"// 律师认证的东西
@implementation XLChongfaApiImplementaionOne


+ (void)XLChongfaApiImplementationEchongFaTypeOtherOperationResponde:(id<ChongFaApiModelProtocol>)responde withAppDelegate:(AppDelegate *)delegate
{
//    if ([self islogin]) {// 登录了
//        if ([USERTYPE isEqualToString:@"1"]) {// 用户
//            // 如果是用户端的就去认证
//            BXTabBarController *tabBarVC =   (BXTabBarController *)delegate.window.rootViewController;
//            NSInteger index = [responde chonfaApibarindex];
//            UINavigationController *navc = nil;
//            if (tabBarVC.childViewControllers.count > index) {
//                navc =   [tabBarVC  xlcustomNavigationBarIndex:index];
//            }
//            Class xlClass = NSClassFromString([responde chongfaApiVC]);
//            UIViewController *xlClasVC = [[xlClass alloc] init];
//            if ([xlClasVC respondsToSelector:@selector(setXlChongfaApiModel:)]) {
//                [xlClasVC performSelector:@selector(setXlChongfaApiModel:) withObject:responde];
//                //配置网络请求的参数等
//                [self configurateTheViewControllerParametersWithResponde:responde withVC:xlClasVC];
//            }
//            if (xlClasVC) {
//                [navc pushViewController:xlClasVC animated:YES];
//            }
//
//
//        } else if ([USERTYPE isEqualToString:@"2"]) {// 律师
//            // 如果是律师端的话就 跳进来就好了
//            LawyerBXTabBarController *tabBarVC = (LawyerBXTabBarController *)delegate.window.rootViewController;
//            Class xlClass = NSClassFromString([responde chongfaApilawyervc]);
//            NSInteger index = [responde chongfaApilawyerindex];
//            UIViewController *xlClasVC = [[xlClass alloc] init];
//            UINavigationController *navc = nil;
//            if ([xlClasVC respondsToSelector:@selector(setXlChongfaApiModel:)]) {
//                [xlClasVC performSelector:@selector(setXlChongfaApiModel:) withObject:responde];
//                // 配置网络请求的参数
//                [self configurateTheViewControllerParametersWithResponde:responde withVC:xlClasVC];
//
//            }
//            if (tabBarVC.childViewControllers.count > index) {
//                tabBarVC.selectedIndex = index;
//                navc                   = tabBarVC.childViewControllers[index];
//
//            }
//            if (xlClasVC) {
//                [navc pushViewController:xlClasVC animated:YES];
//            }
//
//        }
//    } else {// 没有登录
//        // 看我们进的是哪一个界面
//
//        // if  引导页
//        // 引导页 -登录页 - 登录 - //
//        // 引导页 -登录页 - 注册 - //
//        // 登录页 - 注册          //
//        // 登录页 - 登录          //
//
//
//        UINavigationController *viewController = (UINavigationController *)delegate.window.rootViewController;
//        if (viewController &&[viewController isKindOfClass:[UINavigationController class]]) {
//            UIViewController *vc = viewController.topViewController;
//            if ([vc respondsToSelector:@selector(setXlChongfaApiModel:)]) {
//                [vc performSelector:@selector(setXlChongfaApiModel:) withObject:responde];
//            }
//
//        } else {
//
//            if ([viewController respondsToSelector:@selector(setXlChongfaApiModel:)]) {
//                [viewController performSelector:@selector(setXlChongfaApiModel:) withObject:responde];
//            }
//        }
//
//
//
//    }
}
/**
 崇法是否登录

 @return YES 代表登录 NO  代表没有登录
 */
//+ (BOOL)islogin
//{
//    LoginUserModel *model =  UserManager.sharedManager.userModel;
//    return model ? YES : NO;
//
//}

/**
 是否显示引导页

 @return YES 显示引导页 NO  不显示引导页
 */
//+ (BOOL)isDisplayGuidePage
//{
//    BOOL isdisplayGuidePage = UserManager.sharedManager.isDisplayGuidePage;
//    return isdisplayGuidePage;
//}

@end
