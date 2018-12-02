//
//  ChongFaApiModelProtocol.h
//  chongfa
//
//  Created by bilin on 2017/12/19.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol ChongFaApiModelProtocol <NSObject>

@optional


/**
 跳转崇法下到哪一个tableBarController--- 针对律师端的

 @return lawyerTabeBar index
 */
- (NSInteger )chongfaApilawyerindex;

/**
 当有两个端分别做不同的操作的情况下这个返回的是律师端
 
 @return userOrLawyerType == 3 的情况下才有值
 */
- (NSString *)chongfaApilawyervc;

/**
  跳转崇法下到哪一个tableBarController--- 针对用户端的

 @return index
 */
- (NSInteger)chonfaApibarindex;

/**
 要跳转到的崇法的试图空值器

 @return 试图空值器 类名
 */
- (NSString *)chongfaApiVC;

/**
 返回打开崇法的应用程序

 @return 打开崇法的应用程序
 */
- (NSString *)chongfaApiOpenurl;

/**
 返回到原来的应用的

 @return 名字
 */
- (NSString *)chongfaApiBackoriginalappname;

/**
 崇法端可能要隐藏的东西

 @return 东西 用纸代表要隐藏
 */
- (NSString *)chongfaApiHiddensomesting;

/**
 其他应用跳转到崇法携带的参数 这个是备份的用的我们需要在这里面过滤这个东西

 @return 携带的参数
 */
- (NSDictionary *)chongfaApiExtensionParameters;

/**
 这个是我们网络请求需要的参数

 @return 网络请求的参数
 */
- (NSDictionary *)chongfaApiExtensionNetworkParmeters;


/**
 跳转到崇法里目的

 @return 1崇法登录 2认证 3接案 4 其他的
 */
- (NSString *)chongfaApiOpenechongFatostr;
/**
 过滤参数提取出我们需要用到的网络请求需要的参数
 
 @param filterparameter 过滤的参数字典--- 需要过滤的参数 如果为空的话就是默认的参数
 @param parameterDic 需要被过滤的参数
 */
- (void)chongfaApifilterparametershDic:(NSArray *)filterparameter withfilteredDic:(NSDictionary *)parameterDic;

@end
