//
//  LocationManager.m
//  Custom
//
//  Created by bilin on 2017/3/24.
//  Copyright © 2017年 bilin. All rights reserved.
//

#import "LocationManager.h"
#import <UIKit/UIKit.h>
#import "CityAndLocationManager.h"
typedef enum: NSInteger
{
    Defulat = 0,// 默认
    Single,// 单个
    All// 所有
}EType;
@interface LocationManager ()<CLLocationManagerDelegate, UIAlertViewDelegate>

@property (nonatomic, assign) EType xType;
@property (nonatomic, weak) id<CLLocationManagerDelegate> delegate;
@property (nonatomic, strong) NSHashTable *hashTable;
@property (nonatomic, copy) succesBlock success;
@end

@implementation LocationManager

- (NSHashTable *)hashTable
{
    if (_hashTable == nil) {
        _hashTable = [NSHashTable weakObjectsHashTable];
    }
    return _hashTable;
}
// 管理定位管理者
+ (instancetype)sharedLocationManager
{
    static LocationManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[[self class] alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    if (self = [super init]) {
        self.locationManager = [[CLLocationManager alloc]init];
        // 设置代理
        _locationManager.delegate = self;
        // 设置定位精确度到米
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // 设置过滤器为无
        _locationManager.distanceFilter = kCLDistanceFilterNone;
       
       
    }
    return self;
}
// 可以刷新
- (BOOL)canRefush// 看一下是否可以请求数据如果可以的话
{
   UIAlertView *aletView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"您没有开启定位权限请开启定位权限" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
   if (![CLLocationManager locationServicesEnabled]||[CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied ) {
      
      [aletView show];
      
      return NO;
   }else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined|| [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
      [self.locationManager requestWhenInUseAuthorization];
      [aletView dismissWithClickedButtonIndex:0 animated:YES];
   }
   return YES;
   
}


#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    if (self.xType == Defulat) {
        self.delegate = nil;
        [self.locationManager stopUpdatingLocation];
        return;
    }else if (self.xType == Single) {
        self.xType = Defulat;
             [CityAndLocationManager saveLocation:newLocation];// 保存经纬度
        if ([self.delegate respondsToSelector:@selector(locationManager:didUpdateToLocation:fromLocation:)]) {
            [self.delegate locationManager:manager didUpdateToLocation:newLocation fromLocation:oldLocation];
        }
       if (self.success) {// 定位成功的话调用block
          self.success([CityAndLocationManager city]);
       }
       self.success = nil;// 手动值nil

       [self.locationManager stopUpdatingLocation];
    } else if (self.xType == All) {
       [CityAndLocationManager saveLocation:newLocation];// 保存经纬度
        self.xType = Defulat;
        self.delegate = nil;
        id<CLLocationManagerDelegate> obj;
       NSEnumerator *enumerator =   [self.hashTable objectEnumerator];
        while (obj = [enumerator nextObject]) {
            if ([obj respondsToSelector:@selector(locationManager:didUpdateToLocation:fromLocation:)]) {
                [obj locationManager:manager didUpdateToLocation:newLocation fromLocation:oldLocation];
               obj = nil;
            }
          
        }
        [self.locationManager stopUpdatingLocation];
    }
    
}
// 添加代理
- (void)addDelegate:(id<CLLocationManagerDelegate>)delegte
{
    if (![self.hashTable containsObject:delegte]) {// 如果不存在的话就添加代理到数组中
        [self.hashTable addObject:delegte];
    }
}
// 移除某个代理对象
- (void)removeDelegate:(id<CLLocationManagerDelegate>)delegate
{
    if ([self.hashTable containsObject:delegate]) {// 如果存在的话就删除掉代理对象
        [self.hashTable removeObject:delegate];
    }
}
// 开启某个代理对象的定位
- (void)startLocation:(id<CLLocationManagerDelegate>)delegate successBlock:(succesBlock)success errorBlock:(errorBlock)errorBlock
{
    if (![self canRefush]){
        if (errorBlock) {
            errorBlock(@"没有开启定位");
        }
        return;// 没有开启定位权限去开启
    }
    self.xType = Single;// 单个开启定位
    self.delegate = delegate;
    self.success = success;
    [self.locationManager startUpdatingLocation];// 开启定位
}
// 关闭某个对象对象的定位
- (void)stopLocation:(id<CLLocationManagerDelegate>)delegate
{
    self.xType = Defulat;// 默认
    self.delegate = nil;
    [self.locationManager stopUpdatingLocation];// 关闭定位
}
// 开启所有代理对象的定位
- (void)startAllLoaction
{
   if (![self canRefush]) return;// 没有开启定位权限去开启
    self.xType = All;// 开启所有的定位
    self.delegate = nil;
    [self.locationManager startUpdatingLocation];
}
// 关闭所有代理对象的定位
- (void)stopAllLoaction
{
    self.xType = Defulat;// 默认
    self.delegate = nil;
    [self.locationManager stopUpdatingLocation];// 关闭定位
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
        }
            break;
        case 1:
        {
           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }
            break;
            
        default:
            break;
    }
}

- (void)applicationWillEnterForegroundNotification:(id <CLLocationManagerDelegate>)delegate
                                      successBlock:(succesBlock)success

{
   self.success = success;//成功的block
   [self startLocation:delegate successBlock:success errorBlock:nil];
}
- (void)applicationDidFinishLaunchingNotification:(id <CLLocationManagerDelegate>)delegate
                                          success:(succesBlock)succes

{
    [self addDelegate:delegate];
   self.success = succes;// 成功的block
   [self startLocation:delegate successBlock:succes errorBlock:nil];
}

@end
