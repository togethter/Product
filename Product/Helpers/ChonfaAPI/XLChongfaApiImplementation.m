//
//  XLChongfaApiImplementation.m
//  chongfa
//
//  Created by bilin on 2017/12/19.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import "XLChongfaApiImplementation.h"
#import <objc/runtime.h>
@implementation XLChongfaApiImplementation



+ (void)XLChongfaApiImplementationEchongFaTypeOtherOperationResponde:(id<ChongFaApiModelProtocol>)responde withAppDelegate:(AppDelegate *)delegate
{
    
}

+  (BOOL)checkIsExistPropertyWithInstance:(id)instance verifyPropertyName:(NSString *)verifyPropertyName
{
    unsigned int outCount, i;
    
    // 获取对象里的属性列表
    objc_property_t * properties = class_copyPropertyList([instance
                                                           class], &outCount);
    
    for (i = 0; i < outCount; i++) {
        objc_property_t property =properties[i];
        //  属性名转成字符串
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        // 判断该属性是否存在
        if ([propertyName isEqualToString:verifyPropertyName]) {
            free(properties);
            return YES;
        }
    }
    free(properties);
    
    return NO;
}

// 配置试图控制器的页面跳转的以及网络请求需要的必要参数以及可能的需要枚举的值等
+ (void)configurateTheViewControllerParametersWithResponde:(id<ChongFaApiModelProtocol>)responde withVC:(UIViewController *)vc
{
    if ([responde respondsToSelector:@selector(chongfaApiExtensionParameters)]) {
        NSDictionary *dic = [responde chongfaApiExtensionParameters];
        if (dic && [dic isKindOfClass:[NSDictionary class]] && dic.count) {
            if ([responde respondsToSelector:@selector(chongfaApifilterparametershDic:withfilteredDic:)]) {
                [responde chongfaApifilterparametershDic:nil withfilteredDic:dic];
            }
        }
        if ([responde respondsToSelector:@selector(chongfaApiExtensionNetworkParmeters)]) {
            NSDictionary *networkParmeterDic = [responde chongfaApiExtensionNetworkParmeters];
            if (networkParmeterDic && [networkParmeterDic isKindOfClass:[NSDictionary class]] && dic.count) {
                [networkParmeterDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    if ([self checkIsExistPropertyWithInstance:vc verifyPropertyName:key]) {
                        [vc setValue:obj forKey:key];
                    }
                    
                }];
            }

        }
    }
}
@end
