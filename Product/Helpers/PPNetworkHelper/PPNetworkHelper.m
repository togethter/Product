//
//  PPNetworkHelper.m
//  JiFengDaRen
//
//  Created by 陈如意 on 2018/3/16.
//  Copyright © 2018年 陈永发. All rights reserved.
//

#import "PPNetworkHelper.h"
#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"

#ifdef DEBUG
#define PPLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define PPLog(...)
#endif

#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]


@implementation PPNetworkHelper

static BOOL _isOpenLog;   // 是否已开启日志打印
static NSMutableArray *_allSessionTask;
static AFHTTPSessionManager *_sessionManager;

+ (void)openLog {
    _isOpenLog = YES;
}

+ (void)closeLog {
    _isOpenLog = NO;
}

+ (void)cancelAllRequest {
    // 锁操作
    @synchronized(self) {
        [[self allSessionTask] enumerateObjectsUsingBlock:^(NSURLSessionTask  *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            [task cancel];
        }];
        [[self allSessionTask] removeAllObjects];
    }
}

+ (void)cancelRequestWithURL:(NSString *)URL {
    if (!URL) { return; }
    @synchronized (self) {
        [[self allSessionTask] enumerateObjectsUsingBlock:^(NSURLSessionTask  *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task.currentRequest.URL.absoluteString hasPrefix:URL]) {
                [task cancel];
                [[self allSessionTask] removeObject:task];
                *stop = YES;
            }
        }];
    }
}


/**
 存储着所有的请求task数组
 */
+ (NSMutableArray *)allSessionTask {
    if (!_allSessionTask) {
        _allSessionTask = [[NSMutableArray alloc] init];
    }
    return _allSessionTask;
}

#pragma mark - 初始化AFHTTPSessionManager相关属性

/**
 *  所有的HTTP请求共享一个AFHTTPSessionManager
 *  原理参考地址:http://www.jianshu.com/p/5969bbb4af9f
 */
+ (void)initialize {
    _sessionManager = [AFHTTPSessionManager manager];
    _sessionManager.requestSerializer.timeoutInterval = 30.f;
    _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*", nil];
    // 打开状态栏的等待菊花
}
+ (__kindof NSURLSessionTask *)DELETE:(NSString *)URL
                           parameters:(id)parameters
                                cache:(BOOL)cache
                              encrypt:(BOOL)encrypt
                               decode:(BOOL)decode
                        responseCache:(PPHttpRequestCache)responseCache
                              success:(PPHttpRequestSuccess)success
                              failure:(PPHttpRequestFailed)failure{
    if (cache == YES) {
        //读取缓存
        responseCache!=nil ? responseCache([PPNetworkCache httpCacheForURL:URL parameters:parameters]) : nil;
    }
    
    NSURLSessionTask *sessionTask = [_sessionManager DELETE:URL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self delogResponseObject:responseObject url:URL parmeters:parameters];
        [[self allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        //对数据进行异步缓存
        if (cache == YES) {
            responseCache!=nil ? [PPNetworkCache setHttpCache:responseObject URL:URL parameters:parameters] : nil;
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self delogResponseObject:error url:URL parmeters:parameters];
        [[self allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
        
    }];
    // 添加sessionTask到数组
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil ;
    
    return sessionTask;
}

+ (__kindof NSURLSessionTask *)PUT:(NSString *)URL
                        parameters:(id)parameters
                             cache:(BOOL)cache
                           encrypt:(BOOL)encrypt
                            decode:(BOOL)decode
                     responseCache:(PPHttpRequestCache)responseCache
                           success:(PPHttpRequestSuccess)success
                           failure:(PPHttpRequestFailed)failure {
    
    if (cache == YES) {
        //读取缓存
        responseCache!=nil ? responseCache([PPNetworkCache httpCacheForURL:URL parameters:parameters]) : nil;
    }
        NSURLSessionTask *sessionTask = [_sessionManager PUT:URL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            [self delogResponseObject:responseObject url:URL parmeters:parameters];
            
            [[self allSessionTask] removeObject:task];
            success ? success(responseObject) : nil;
            //对数据进行异步缓存
            if (cache == YES) {
                responseCache!=nil ? [PPNetworkCache setHttpCache:responseObject URL:URL parameters:parameters] : nil;
            }
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [self delogResponseObject:error url:URL parmeters:parameters];
            [[self allSessionTask] removeObject:task];
            failure ? failure(error) : nil;
            
        }];
        // 添加sessionTask到数组
        sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil ;
        
        return sessionTask;
    
}
+ (void)delogResponseObject:(id)responseObject url:(NSString *)URL parmeters:(id)parameters {
    
    if (_isOpenLog) {
        PPLog(@"responseObject = %@,url=%@,parameters =%@",responseObject,URL,parameters?:@{});
    }
    
}
#pragma mark - GET请求是否自动缓存
+ (NSURLSessionTask *)GET:(NSString *)URL
               parameters:(id)parameters
                    cache:(BOOL)cache
                  encrypt:(BOOL)encrypt
                   decode:(BOOL)decode
            responseCache:(PPHttpRequestCache)responseCache
                  success:(PPHttpRequestSuccess)success
                  failure:(PPHttpRequestFailed)failure {
    
    if (cache == YES) {
        //读取缓存
        responseCache!=nil ? responseCache([PPNetworkCache httpCacheForURL:URL parameters:parameters]) : nil;
    }
    
    NSURLSessionTask *sessionTask = [_sessionManager GET:URL parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self delogResponseObject:responseObject url:URL parmeters:parameters];
        
        [[self allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        //对数据进行异步缓存
        if (cache == YES) {
            responseCache!=nil ? [PPNetworkCache setHttpCache:responseObject URL:URL parameters:parameters] : nil;
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self delogResponseObject:error url:URL parmeters:parameters];
        [[self allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
        
    }];
    // 添加sessionTask到数组
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil ;
    
    return sessionTask;
}

#pragma mark - POST请求是否自动缓存
+ (NSURLSessionTask *)POST:(NSString *)URL
                parameters:(id)parameters
                     cache:(BOOL)cache
                   encrypt:(BOOL)encrypt
                    decode:(BOOL)decode
             responseCache:(PPHttpRequestCache)responseCache
                   success:(PPHttpRequestSuccess)success
                   failure:(PPHttpRequestFailed)failure {
        
    if (cache == YES) {
        //读取缓存
        responseCache!=nil ? responseCache([PPNetworkCache httpCacheForURL:URL parameters:parameters]) : nil;
    }
    NSURLSessionTask *sessionTask = [_sessionManager POST:URL parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self delogResponseObject:responseObject url:URL parmeters:parameters];
        [[self allSessionTask] removeObject:task];
        success ? success(responseObject) : nil;
        //对数据进行异步缓存
        if (cache == YES) {
            responseCache!=nil ? [PPNetworkCache setHttpCache:responseObject URL:URL parameters:parameters] : nil;
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self delogResponseObject:error url:URL parmeters:parameters];
        [[self allSessionTask] removeObject:task];
        failure ? failure(error) : nil;
        
    }];
    
    // 添加最新的sessionTask到数组
    sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil ;
    return sessionTask;
}

#pragma mark - 重置AFHTTPSessionManager相关属性


+ (void)setAFHTTPSessionManagerProperty:(void (^)(AFHTTPSessionManager *))sessionManager {
    sessionManager ? sessionManager(_sessionManager) : nil;
}

+ (void)setRequestSerializer:(PPRequestSerializer)requestSerializer {
    _sessionManager.requestSerializer = requestSerializer==PPRequestSerializerHTTP ? [AFHTTPRequestSerializer serializer] : [AFJSONRequestSerializer serializer];
}

+ (void)setResponseSerializer:(PPResponseSerializer)responseSerializer {
    _sessionManager.responseSerializer = responseSerializer==PPResponseSerializerHTTP ? [AFHTTPResponseSerializer serializer] : [AFJSONResponseSerializer serializer];
}

+ (void)setRequestTimeoutInterval:(NSTimeInterval)time {
    _sessionManager.requestSerializer.timeoutInterval = time;
}

+ (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field {
    [_sessionManager.requestSerializer setValue:value forHTTPHeaderField:field];
}

+ (void)openNetworkActivityIndicator:(BOOL)open {
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:open];
}

+ (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName {
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    // 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // 如果需要验证自建证书(无效证书)，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    // 是否需要验证域名，默认为YES;
    securityPolicy.validatesDomainName = validatesDomainName;
    securityPolicy.pinnedCertificates = [[NSSet alloc] initWithObjects:cerData, nil];
    
    [_sessionManager setSecurityPolicy:securityPolicy];
}

@end


#pragma mark - NSDictionary,NSArray的分类
/*
 ************************************************************************************
 *新建NSDictionary与NSArray的分类, 控制台打印json数据中的中文
 ************************************************************************************
 */

#ifdef DEBUG
@implementation NSArray (PP)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    [strM appendString:@")"];
    
    return strM;
}

@end

@implementation NSDictionary (PP)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}
@end
#endif

