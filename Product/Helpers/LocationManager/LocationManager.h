//
//  LocationManager.h
//  Custom
//
//  Created by bilin on 2017/3/24.
//  Copyright © 2017年 bilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@class LocationManager;
typedef void(^succesBlock)(id);
typedef void(^errorBlock)(id);
@interface LocationManager : NSObject
// 定位管理者
@property (nonatomic, strong) CLLocationManager *locationManager;

// 管理定位管理者
+ (instancetype)sharedLocationManager;
// 添加代理
- (void)addDelegate:(id<CLLocationManagerDelegate>)delegte;
// 移除某个代理对象
- (void)removeDelegate:(id<CLLocationManagerDelegate>)delegate;
// 开启某个代理对象的定位
- (void)startLocation:(id<CLLocationManagerDelegate>)delegate successBlock:(succesBlock)success errorBlock:(errorBlock)errorBlock;
// 关闭某个代理对象的定位
- (void)stopLocation:(id<CLLocationManagerDelegate>)delegate;
// 开启所有代理对象的定位
- (void)startAllLoaction;
// 关闭所有代理对象的定位
- (void)stopAllLoaction;
// 可以刷新
- (BOOL)canRefush;// 看一下是否可以请求数据如果可以的话

// 在应用程序将要进入前台的时候调用
// 定位成功的success block
// 传值为成功的城市
- (void)applicationWillEnterForegroundNotification:(id <CLLocationManagerDelegate>)delegate
                                      successBlock:(succesBlock)success;

// 在应用程序已经完成启动的时候调用
// 定位成功的successBlock
// 传值为成功的城市
- (void)applicationDidFinishLaunchingNotification:(id <CLLocationManagerDelegate>)delegate
                                          success:(succesBlock)succes;


@end
