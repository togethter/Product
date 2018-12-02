//
//  SystemUpdateManager.m
//  ChongFa
//
//  Created by bilin on 2017/3/23.
//  Copyright © 2017年 lixueliang. All rights reserved.
//

#import "SystemUpdateManager.h"
#import "SystemUpModel.h"

@interface SystemUpdateManager ()
@end
@implementation SystemUpdateManager

//updateAll // 0 部分跟新 1 所有的强制更新2所有不更新 appstore的时候选择2，3 所有版本都不需要强制跟新
//
//其中在versionDicArr 中每一个版本的数组中最后一位有一个标识符位改标志服非空（YES）或者（NO）—————YES 表示强制更新， NO —— 表示不强制跟新
//如果选择0的话， 返回的数据中最后一位是YES， （改版本）表示强制跟新， 返回的是NO的话 （改版本）表示不强制跟新
//选择1的话， 所有版本都要强制更新
+ (void)showVersionWith:(XLAppDelegate *)delegate{
    
    [self customshowVersionWith:delegate];
}


// 新的版本升级
+ (void)customshowVersionWith:(XLAppDelegate *)delegate{
//
//    [[YXHTTPRequst shareInstance] networking:@"http://api.chongfa.cn/v8/app/updateConfigIos" parameters:nil method:YXRequstMethodTypePOST success:^(NSDictionary *obj) {
//        DLog(@"%@", obj);
//        if ([obj isKindOfClass:[NSDictionary class]]) {
//            SystemUpModel *systemUpModel = [SystemUpModel new];
//            [systemUpModel setValuesForKeysWithDictionary:obj];
//            if ([systemUpModel.updateAll isEqualToString:@"1"]) {// 所有强制更新
//#pragma mark -- hhh
//
//                delegate.upSystem.dataArray = systemUpModel.versionDicArr[[self getVersion]];
//                [delegate.upSystem temporarilyBtnuserInteractionEnabled:NO];// 因为所有的都强制更新所以用户交互关闭
//                [self VersionButton:delegate];
//            } else if ([systemUpModel.updateAll isEqualToString:@"0"]) { // 部分跟新 我们现在总共有5个版本
//                if ([systemUpModel.versionArray containsObject:[self getVersion]]) {
//#pragma mark -- hhh
//
//                    delegate.upSystem.dataArray = systemUpModel.versionDicArr[[self getVersion]];
//                    if ([delegate.upSystem.dataArray.lastObject isEqualToString:@"YES"]) { // 部分强制跟新
//                        [delegate.upSystem temporarilyBtnuserInteractionEnabled:NO];// 用户交互关闭
//                    } else if ([delegate.upSystem.dataArray.lastObject isEqualToString:@"NO"]) {// 部分不需要强制更新
//                        [delegate.upSystem temporarilyBtnuserInteractionEnabled:YES];// 用户交互打开
//                    }
//                    [self VersionButton:delegate];
//                }
//            } else if ([systemUpModel.updateAll isEqualToString:@"2"]) {// 所有不跟新
//
//            } else if ([systemUpModel.updateAll isEqualToString:@"3"]) {// 版本不强制跟新显示❌号
//#pragma mark -- hhh
//
//                if ([systemUpModel.versionArray containsObject:[self getVersion]]) {
//                    delegate.upSystem.dataArray = systemUpModel.versionDicArr[[self getVersion]];
//                    [delegate.upSystem temporarilyBtnuserInteractionEnabled:YES];// 用户交互打开
//                    [self VersionButton:delegate];
//                }
//            }
//        }
//
//
//
//    } failsure:^(NSError *error) {
//
//    }];
//


}


// 版本更新
+ (void)VersionButton:(XLAppDelegate *)delegate
{
//    [[YXHTTPRequst shareInstance] networking:@"http://itunes.apple.com/lookup?id=1121257704" parameters:nil method:YXRequstMethodTypePOST success:^(NSDictionary *dic) {
//        //        NSLog(@"%@", dic);
//        DLog(@"%@", dic);
//        NSArray *array = dic[@"results"];
//        NSDictionary *verDic = array.firstObject;
//        NSString * version = verDic[@"version"];
//        if (version != nil) {
//            [self checkAppUpdate:version appDelegate:delegate];
//        }
//
//    } failsure:^(NSError *error) {
//
//    } ];
    
}

+ (NSString *)getVersion
{
    id a =  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *as = [NSString stringWithFormat:@"%@", a]; //版本号获得了
    return as;
}


#pragma mark ---- 比较当前版本与最新上线版本作比较
+ (void)checkAppUpdate:(NSString *)appInfo appDelegate:(XLAppDelegate *)delegate
{
    // 获取当前版本
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    /*
     *  判断， 如果当前版本与发布的版本不相同， 则进入更新， 如果相等， 那么当前的版本就是最高版本
     */
    
//    if (![appInfo isEqualToString:version]) {
//#pragma mark -- hhh
//            [delegate.window addSubview:delegate.bt];
//            [delegate.window addSubview:delegate.upSystem];
//            [delegate.upSystem mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(310 * XLh);
//            make.height.mas_equalTo((310 * XLh) * 0.6);
//            make.center.mas_equalTo(delegate.window);
//        }];
//
//
//    } else {
//
//    }
}
@end
