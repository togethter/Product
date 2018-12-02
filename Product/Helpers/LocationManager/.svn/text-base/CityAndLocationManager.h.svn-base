//
//  CityAndLocationManager.h
//  Custom
//
//  Created by bilin on 2017/4/7.
//  Copyright © 2017年 bilin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class CLLocation;
@interface CityAndLocationManager : NSObject
// 保存的城市名字 nil为空
+(NSString *)city;// 市

+(NSString *)provice;// 省

+(NSString *)subLocality; // 区域
// 保存的所在城市的经纬度 nil为空
+(CLLocation *)location;
// 保存经纬度
+ (void)saveLocation:(CLLocation *)location;
// 保存城市
+ (void)saveCity:(NSString *)city;
// 清除本地的经纬度以及城市
+ (void)clearLocationAndCity;

// 通过定位信息获取本地的市的编号用于注册里面的
+ (NSString *)byLocatonCityGetLocalNumber;
// 通过定位信息获取本地的省的编号用于注册里面的
+ (NSString *)byLocationProviceGetLocalNumber;
// 通过定位信息获取本地的区域的编号用于注册里面的
+ (NSString *)byLocationSubLocalityGetLocalNumber;

// 通过cityID取城市的名字
+ (NSString *)getCityByID:(NSString *)cityId;
@end
