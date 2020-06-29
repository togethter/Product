//
//  PPNetworkHelper.h
//  JiFengDaRen
//
//  Created by 陈如意 on 2018/3/16.
//  Copyright © 2018年 陈永发. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PPNetworkCache.h"

typedef NS_ENUM(NSUInteger, PPRequestSerializer) {
    /// 设置请求数据为JSON格式
    PPRequestSerializerJSON,
    /// 设置请求数据为二进制格式
    PPRequestSerializerHTTP,
};

typedef NS_ENUM(NSUInteger, PPResponseSerializer) {
    /// 设置响应数据为JSON格式
    PPResponseSerializerJSON,
    /// 设置响应数据为二进制格式
    PPResponseSerializerHTTP,
};

/// 请求成功的Block
typedef void(^PPHttpRequestSuccess)(id result);

/// 请求失败的Block
typedef void(^PPHttpRequestFailed)(NSError *error);

/// 缓存的Block
typedef void(^PPHttpRequestCache)(id responseCache);

/// 上传或者下载的进度, Progress.completedUnitCount:当前大小 - Progress.totalUnitCount:总大小
typedef void (^PPHttpProgress)(NSProgress *progress);

/// 网络状态的Block
//typedef void(^PPNetworkStatus)(PPNetworkStatusType status);

@class AFHTTPSessionManager;

@interface PPNetworkHelper : NSObject


/// 取消所有HTTP请求
+ (void)cancelAllRequest;

/// 实时获取网络状态,通过Block回调实时获取(此方法可多次调用)
//+ (void)networkStatusWithBlock:(PPNetworkStatus)networkStatus;

/// 取消指定URL的HTTP请求
+ (void)cancelRequestWithURL:(NSString *)URL;

/// 开启日志打印 (Debug级别)
+ (void)openLog;

/// 关闭日志打印,默认关闭
+ (void)closeLog;


/**
 *  GET请求,是否自动缓存
 *
 *  @param URL           请求地址
 *  @param parameters    请求参数
 *  @param cache         请求缓存
 *  @param encrypt       请求加密
 *  @param decode        请求是否解密
 *  @param responseCache 缓存数据的回调
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
                        parameters:(id)parameters
                             cache:(BOOL)cache
                           encrypt:(BOOL)encrypt
                            decode:(BOOL)decode
                     responseCache:(PPHttpRequestCache)responseCache
                           success:(PPHttpRequestSuccess)success
                           failure:(PPHttpRequestFailed)failure;


+ (__kindof NSURLSessionTask *)DELETE:(NSString *)URL
                        parameters:(id)parameters
                             cache:(BOOL)cache
                           encrypt:(BOOL)encrypt
                            decode:(BOOL)decode
                     responseCache:(PPHttpRequestCache)responseCache
                           success:(PPHttpRequestSuccess)success
                           failure:(PPHttpRequestFailed)failure;
    + (__kindof NSURLSessionTask *)PUT:(NSString *)URL
                               parameters:(id)parameters
                                    cache:(BOOL)cache
                                  encrypt:(BOOL)encrypt
                                   decode:(BOOL)decode
                            responseCache:(PPHttpRequestCache)responseCache
                                  success:(PPHttpRequestSuccess)success
                                  failure:(PPHttpRequestFailed)failure;

/**
 *  POST请求,是否自动缓存
 *
 *  @param URL           请求地址
 *  @param parameters    请求参数
 *  @param responseCache 缓存数据的回调
 *  @param cache         请求是否缓存
 *  @param encrypt       请求是否解密
 *  @param decode        请求是否加密
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)POST:(NSString *)URL
                         parameters:(id)parameters
                              cache:(BOOL)cache
                            encrypt:(BOOL)encrypt
                             decode:(BOOL)decode
                      responseCache:(PPHttpRequestCache)responseCache
                            success:(PPHttpRequestSuccess)success
                            failure:(PPHttpRequestFailed)failure;


#pragma mark - 设置AFHTTPSessionManager相关属性
#pragma mark 注意: 因为全局只有一个AFHTTPSessionManager实例,所以以下设置方式全局生效
/**
 在开发中,如果以下的设置方式不满足项目的需求,就调用此方法获取AFHTTPSessionManager实例进行自定义设置
 (注意: 调用此方法时在要导入AFNetworking.h头文件,否则可能会报找不到AFHTTPSessionManager的❌)
 @param sessionManager AFHTTPSessionManager的实例
 */
+ (void)setAFHTTPSessionManagerProperty:(void(^)(AFHTTPSessionManager *sessionManager))sessionManager;

/**
 *  设置网络请求参数的格式:默认为二进制格式
 *
 *  @param requestSerializer PPRequestSerializerJSON(JSON格式),PPRequestSerializerHTTP(二进制格式),
 */
+ (void)setRequestSerializer:(PPRequestSerializer)requestSerializer;

/**
 *  设置服务器响应数据格式:默认为JSON格式
 *
 *  @param responseSerializer PPResponseSerializerJSON(JSON格式),PPResponseSerializerHTTP(二进制格式)
 */
+ (void)setResponseSerializer:(PPResponseSerializer)responseSerializer;

/**
 *  设置请求超时时间:默认为30S
 *
 *  @param time 时长
 */
+ (void)setRequestTimeoutInterval:(NSTimeInterval)time;

/// 设置请求头
+ (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;

/**
 *  是否打开网络状态转圈菊花:默认打开
 *
 *  @param open YES(打开), NO(关闭)
 */
+ (void)openNetworkActivityIndicator:(BOOL)open;

/**
 配置自建证书的Https请求, 参考链接: http://blog.csdn.net/syg90178aw/article/details/52839103
 
 @param cerPath 自建Https证书的路径
 @param validatesDomainName 是否需要验证域名，默认为YES. 如果证书的域名与请求的域名不一致，需设置为NO; 即服务器使用其他可信任机构颁发
 的证书，也可以建立连接，这个非常危险, 建议打开.validatesDomainName=NO, 主要用于这种情况:客户端请求的是子域名, 而证书上的是另外
 一个域名。因为SSL证书上的域名是独立的,假如证书上注册的域名是www.google.com, 那么mail.google.com是无法验证通过的.
 */
+ (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName;


@end
