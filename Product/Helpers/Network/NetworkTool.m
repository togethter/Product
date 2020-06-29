//
//  NetworkTool.m
//  PPNetworkHelper
//
//  Created by GD on 2020/6/19.
//  Copyright © 2020 AndyPang. All rights reserved.
//

#import "NetworkTool.h"
#import "PPNetworkHelper.h"
@implementation NetworkTool

+ (void)Request:(RequestMethod)method domainUrlStr:(NSString *)domainUrlStr url:(NSString *)url param:(NSDictionary *)param
        success:(RequestSuccess)success
        failure:(RequestFailed)failure {
#ifdef DEBUG
    [PPNetworkHelper openLog];
    
#else
    [PPNetworkHelper closeLog];
#endif
    url = [NSString stringWithFormat:@"%@%@",domainUrlStr,url];
    switch (method) {
        case GET:
            [PPNetworkHelper GET:url parameters:param cache:NO encrypt:NO decode:NO responseCache:nil success:success failure:failure];
            break;
        case POST:
            [PPNetworkHelper POST:url parameters:param cache:NO encrypt:NO decode:NO responseCache:nil success:success failure:failure];
            break;
        case DELETE:
            [PPNetworkHelper DELETE:url parameters:param cache:NO encrypt:NO decode:NO responseCache:nil success:success failure:failure];
            break;
        case PUT:
            [PPNetworkHelper PUT:url parameters:param cache:NO encrypt:NO decode:NO responseCache:nil success:success failure:failure];
            break;
        default:
            break;
    }
    
}
+ (void)JSONRequest:(RequestMethod)method domainUrlStr:(NSString *)domainUrlStr url:(NSString *)url param:(NSDictionary *)param
            success:(RequestSuccess)success
            failure:(RequestFailed)failure {
    /// 表单请求方式
    [PPNetworkHelper setRequestSerializer:PPRequestSerializerJSON];
    /// 设置请求头
//    PPNetworkHelper setValue:<#(NSString *)#> forHTTPHeaderField:<#(NSString *)#>
    [self Request:method domainUrlStr:domainUrlStr url:url param:param success:success failure:failure];

}
+ (void)FORMRequest:(RequestMethod)method domainUrlStr:(NSString *)domainUrlStr url:(NSString *)url param:(NSDictionary *)param
            success:(RequestSuccess)success
            failure:(RequestFailed)failure {
    /// 表单请求方式
    [PPNetworkHelper setRequestSerializer:PPRequestSerializerHTTP];
    /// 设置请求头
//    PPNetworkHelper setValue:<#(NSString *)#> forHTTPHeaderField:<#(NSString *)#>
    [self Request:method domainUrlStr:domainUrlStr url:url param:param success:success failure:failure];
    
    
}
@end
