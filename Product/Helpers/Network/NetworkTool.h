//
//  NetworkTool.h
//  PPNetworkHelper
//
//  Created by GD on 2020/6/19.
//  Copyright © 2020 AndyPang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    GET,
    POST,
    DELETE,
    PUT,
} RequestMethod;

@interface NetworkTool : NSObject

/// 请求成功的Block
typedef void(^RequestSuccess)(id result);

/// 请求失败的Block
typedef void(^RequestFailed)(NSError *error);


/**
 JSON格式网络请求方法
 
 @param method 请求类型 get post delete
 @param domainurlStr 域名
 @param url 接口
 @param param 参数
 @param success 成功的回调
 @param failure 失败的回调
 */
+ (void)JSONRequest:(RequestMethod)method domainUrlStr:(NSString *)domainUrlStr url:(NSString *)url param:(NSDictionary *)param
        success:(RequestSuccess)success
        failure:(RequestFailed)failure;
/**
 FORM表单格式网络请求方法
 
 @param method 请求类型 get post delete
 @param domainurlStr 域名
 @param url 接口
 @param param 参数
 @param success 成功的回调
 @param failure 失败的回调
 */

+ (void)FORMRequest:(RequestMethod)method domainUrlStr:(NSString *)domainUrlStr url:(NSString *)url param:(NSDictionary *)param
        success:(RequestSuccess)success
        failure:(RequestFailed)failure;
@end

NS_ASSUME_NONNULL_END
