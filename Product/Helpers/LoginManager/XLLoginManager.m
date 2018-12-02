//
//  XLLoginManager.m
//  chongfa
//
//  Created by bilin on 2017/3/25.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import "XLLoginManager.h"
//#import "StartViewController.h"
//#import "LoginViewController.h"
//#import "BXNavigationController.h"
//#import "BXTabBarController.h"
//#import "LawyerBXTabBarController.h"
//
//#import "XLThirdPartyLoginViewController.h"
@implementation XLLoginManager

// 显示新特性
//+ (BOOL )isDisplayGuidePage
//{

//    return [[UserManager sharedManager] isDisplayGuidePage];
//
//}
+ (void)UserOrLayerOrFirstLoginWith:(UIWindow *)window withLaunchOptions:(NSDictionary *)launchOptions

{
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeCustom];
//    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
//    [SVProgressHUD setForegroundColor:[UIColor blackColor]];
//    [SVProgressHUD setBackgroundColor:RGBACOLOR(236, 240, 241, 0)];
//    [SVProgressHUD setBackgroundLayerColor:RGBACOLOR(236, 236, 236, 0)];
//
//
//    if ([self isDisplayGuidePage]) {// 判断当前的版本号是否沙河中存的版本号是否一致， 如果一直的话就说明没有版本更新
//        StartViewController  *landingVCs = [[StartViewController alloc]init];
//        window.rootViewController = landingVCs;
//
//    } else {// 说明之前登录过
//        LoginUserModel *userLogin = [UserManager sharedManager].userModel;
//        if (userLogin) {// 说明之前登录过
//            // 这里直接进入跟试图控制器
//            if (IS_VALID_STRING(userLogin.usertips) && [userLogin.usertips isEqualToString:@"2"] && IS_VALID_STRING(userLogin.usertype) &&[userLogin.usertype isEqualToString:@"1"]) {
//                BXTabBarController * tabBarController = [[BXTabBarController alloc]init];
//                window.rootViewController = tabBarController;
//                [self loginNIMI];
//                if ([launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]) {
//                    [[NSNotificationCenter defaultCenter] postNotificationName:@"销毁后推送进入" object:nil];
//                }
//            } else {
//                // 这里
//                LawyerBXTabBarController *tabBarController = [[LawyerBXTabBarController alloc] init];
//                window.rootViewController = tabBarController;
//                [self loginNIMI];
//                if ([launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey]) {
//                     [[NSNotificationCenter defaultCenter] postNotificationName:@"销毁后推送进入" object:nil];
//                }
//                // 上传律师的定位定位信息
//                [XLUpdateTheLawyerLocationHelper updateTheLawyerLayerLocationAction];
//            }
//
//        } else { // 没有登录过
//            LoginViewController *landingVC = [[LoginViewController alloc]init];
//            BXNavigationController * nav = [[BXNavigationController alloc]initWithRootViewController:landingVC];
//            window.rootViewController = nav;
//        }
//
//    }
}

+ (void)loginNIMI{
//    NSString *accid = ACCID;
//    NSString *token = TOKEN;
//    __weak typeof(self)wekSelf = self;
//    [[[NIMSDK sharedSDK] loginManager] login:accid
//                                       token:token
//                                  completion:^(NSError *error) {
//
//                                      if (error == nil) {//如果error恒等于nil的话证明登录成功了在通知
//
//                                          [self postNIMSDKAlreadyLoginNotifaction];
//
//                                      }
//
//                                      if (error) {
//                                          DLog(@"%@",error);
//
//                                          [wekSelf aotoLoginNIMI];
//
//                                      }
//
//
//                                  }
//
//     ];
    
    
}

+ (void)postNIMSDKAlreadyLoginNotifaction
{
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"NIMSDKAlreadyLogin" object:nil];
    
}
+ (void)aotoLoginNIMI{
    
    
//    [[[NIMSDK sharedSDK] loginManager] autoLogin:ACCID token:TOKEN];
    
    
}




@end
