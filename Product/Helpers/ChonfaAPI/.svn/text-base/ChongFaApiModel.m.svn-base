//
//  ChongFaApiModel.m
//  chongfa
//
//  Created by bilin on 2017/12/19.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import "ChongFaApiModel.h"

@implementation ChongFaApiModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([value isKindOfClass:[NSNumber class]]) {
        [self.ExtensionParameters setValue:[NSString stringWithFormat:@"%@", value] forUndefinedKey:key];
    } else {
        if (value) {
            [self.ExtensionParameters setValue:value forKey:key];
        }
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ExtensionParameters = [NSMutableDictionary dictionary];
    }
    return self;
}
/**
 当有两个端分别做不同的操作的情况下这个返回的是律师端
 
 @return userOrLawyerType == 3 的情况下才有值
 */
- (NSString *)chongfaApilawyervc
{
    return self.lawyervc;
}

/**
 跳转崇法下到哪一个tableBarController
 
 @return index 针对律师端的
 */
- (NSInteger )chongfaApilawyerindex
{
    return self.lawyindex.integerValue;
}


/**
 跳转崇法下到哪一个tableBarController
 
 @return index 针对用户端的
 */
- (NSInteger)chonfaApibarindex
{
    return self.barindex.integerValue;
}

/**
 要跳转到的崇法的试图空值器
 
 @return 试图空值器 类名
 */
- (NSString *)chongfaApiVC
{
    return self.vc;
}

/**
 返回打开崇法的应用程序
 
 @return 打开崇法的应用程序
 */
- (NSString *)chongfaApiOpenurl
{
    NSParameterAssert(self.openurl);
    return self.openurl;
}

/**
 返回到原来的应用的
 
 @return 名字
 */
- (NSString *)chongfaApiBackoriginalappname
{
    NSParameterAssert(self.backoriginalappname);
    return [self.backoriginalappname  stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

/**
 崇法端可能要隐藏的东西
 
 @return 东西 用纸代表要隐藏
 */
- (NSString *)chongfaApiHiddensomesting
{
    return self.hiddensomesting;
}

/**
 其他应用跳转到崇法携带的参数
 
 @return 携带的参数
 */
- (NSDictionary *)chongfaApiExtensionParameters
{
    return self.ExtensionParameters;
}


/**
 跳转到崇法里目的
 
 @return 1崇法登录 2认证 3接案 4 其他的
 */
- (NSString *)chongfaApiOpenechongFatostr
{
    NSParameterAssert(self.echongFaTostr);
    return self.echongFaTostr;
}


/**
 过滤参数提取出我们需要用到的网络请求需要的参数

 @param filterparameter 过滤的参数字典--- 需要过滤的参数 如果为空的话就是默认的参数
 @param parameterDic 需要被过滤的参数
 */
- (void)chongfaApifilterparametershDic:(NSArray *)filterparameter withfilteredDic:(NSDictionary *)parameterDic
{
    if (!IS_VALID_ARRAY(filterparameter)) {
        filterparameter =  [self filterParameter];
    }
    if (parameterDic && [parameterDic isKindOfClass:[NSDictionary class]] && parameterDic.count) {// 如果存在话在操作
        [parameterDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if (![filterparameter containsObject:key]) {
                [self.networkParmeters setValue:obj forKey:key];
            }
        }];
    }
}
- (NSMutableDictionary *)ExtensionParameters
{
    if (!_ExtensionParameters) {
        _ExtensionParameters = [NSMutableDictionary dictionary];
    }
    return _ExtensionParameters;
}

- (NSMutableDictionary *)networkParmeters
{
    if (!_networkParmeters) {
        _networkParmeters = [NSMutableDictionary dictionary];
    }
    return _networkParmeters;
}
- (NSArray *)filterParameter
{
    return  @[
              @"barindex",
              @"lawyindex",
              @"vc",
              @"lawyervc",
              @"openurl",
              @"backoriginalappname",
              @"hiddensomesting",
              @"echongFaTostr"
              ];
}

- (NSDictionary *)chongfaApiExtensionNetworkParmeters
{
    return self.networkParmeters;
}

@end
