//
//  CityAndLocationManager.m
//  Custom
//
//  Created by bilin on 2017/4/7.
//  Copyright © 2017年 bilin. All rights reserved.
//

#import "CityAndLocationManager.h"
#import <CoreLocation/CoreLocation.h>//地图定位框架
static NSString const *xcity = @"city"; // 市区
static NSString const *xlocation = @"location";
static NSString const *xsheng = @"xprovinces";// 省份
static NSString const *xlQuYu = @"xlQuYu";// 区域
@implementation CityAndLocationManager
// 保存的城市名字 nil为空
+(NSString *)city
{
    //    NSParameterAssert([[NSUserDefaults standardUserDefaults] objectForKey:xcity]);
    NSString *hcity = [[NSUserDefaults standardUserDefaults] objectForKey:xcity];
    if (IS_VALID_STRING(hcity)) {
        return hcity;
    } else {
        return @"";
    }
}
// 省
+(NSString *)provice
{
    //    NSParameterAssert([[NSUserDefaults standardUserDefaults] objectForKey:xsheng]);
    NSString *hprovice = [[NSUserDefaults standardUserDefaults] objectForKey:xsheng];
    if (IS_VALID_STRING(hprovice)) {
        return hprovice;
    } else {
        return @"";
    }
}
// 区域
+(NSString *)subLocality
{
    //    NSParameterAssert([[NSUserDefaults standardUserDefaults] objectForKey:xlQuYu]);
    NSString *hsubLocality = [[NSUserDefaults standardUserDefaults] objectForKey:xlQuYu];
    if (IS_VALID_STRING(hsubLocality)) {
        return hsubLocality;
    } else {
        return @"";
    }
}


// 保存的所在城市的经纬度 nil为空
+(CLLocation *)location
{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:xlocation];
    //    NSParameterAssert(data);
    if (data != nil) {
        CLLocation *location = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        //        NSParameterAssert(location);
        if (location == nil) {
            location = nil;
        }
        return location;
        
    }
    return nil;
}




// 保存经纬度
+ (void)saveLocation:(CLLocation *)location
{
    //    NSParameterAssert(location);
    if (location != nil) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:location];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:xlocation];
        [[NSUserDefaults standardUserDefaults] synchronize];
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *array, NSError *error){
            if (array.count > 0){
                CLPlacemark *placemark = [array objectAtIndex:0];
                //将获得的所有信息显示到label上
                //            NSString*string3 = placemark.name;
                //获取城市
                NSString *city = placemark.locality;
                if (IS_VALID_STRING(placemark.administrativeArea)) {// 保存的省
                    [self saveCity:placemark.administrativeArea withKey:xsheng];
                }
                
                if (IS_VALID_STRING(placemark.subLocality)) {// 区域
                    [self saveCity:placemark.subLocality withKey:xlQuYu];
                }
                
                //                placemark.administrativeAreanss
                if (!IS_VALID_STRING(city)) {
                    //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                    city = placemark.administrativeArea;
                }
                
                if (IS_VALID_STRING(city)) {//如果市存在的话就保存一下
                    
                    // 保存的市区
                    [self saveCity:city withKey:xcity];
                    
                }
                
                
            }
            else if (error == nil && [array count] == 0)
            {
                DLog(@"No results were returned.");
            }
            else if (error != nil)
            {
                DLog(@"An error occurred = %@", error);
            }
        }];
        
    }
    
}
// 保存城市
+ (void)saveCity:(NSString *)city withKey:(NSString *)key
{
    //    NSParameterAssert(city);
    if (city.length == 0) {
        city = @"";
    }
    [[NSUserDefaults standardUserDefaults] setObject:city forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (void)clearLocationAndCity
{   // 清除本地的省 区域 城市
    [self clearLocationAndCitywithKey:xsheng];
    [self clearLocationAndCitywithKey:xlQuYu];
    [self clearLocationAndCitywithKey:xcity];
}
// 清除本地的经纬度以及城市
+ (void)clearLocationAndCitywithKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

// 通过定位信息获取本地的市的编号用于注册里面的
+ (NSString *)byLocatonCityGetLocalNumber
{
    NSString *xxxxcity =  [self city];
    if (IS_VALID_STRING(xxxxcity)) {// 安全操作本地的存在并且是字符串
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"xlCity.plist" ofType:nil]];
        if (!(dic && [dic isKindOfClass:[NSDictionary class]] && dic.count)) {// 如果本地没有存数据的话直接返回@"0"就好
            return @"";
        }
        NSDictionary *cityDic = dic[@"city"];
        NSString *proviceId = [self getTheProviceId];// 得到身份的id
        if (IS_VALID_STRING(proviceId)) {// 判断存在不存在的
            NSDictionary *newDic = cityDic[[self getTheProviceId]];
            if (!(cityDic && [cityDic isKindOfClass:[NSDictionary class]] && cityDic.count && newDic && [newDic isKindOfClass:[NSDictionary class]] && newDic.count)) {// 安全操作如果本地没有具体的东西直接返回@"0"就好
                return @"";
            }
            NSString *value = nil;
            for (NSString *key in newDic) {
                value = newDic[key];
                if ([value isEqualToString:xxxxcity]) {
                    if (IS_VALID_STRING(key)) {
                        return key;
                    } else {
                        return @"";
                    }
                }
            }
        }
        
    } else {// 没有开启定位的人群我们获取不到具体的定位
        return @"";
    }
    return @"";
}
// 通过定位信息获取本地的省的编号用于注册里面的
+ (NSString *)byLocationProviceGetLocalNumber
{
    NSString *proviceId = [self getTheProviceId];//获取到ProviceId
    return proviceId;
}
// 通过定位信息获取本地的区域的编号用于注册里面的
+ (NSString *)byLocationSubLocalityGetLocalNumber
{
    NSString *areaId = [self getTheAreaId];// 获取到区域的id
    return areaId;
}

// 获取到城市的id
+ (NSString *)getTheProviceId
{
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"xlCity.plist" ofType:nil]];
    NSDictionary *proviceDic = dic[@"province"];
    NSString *benDiProvice = [self provice];// 本地的省份

    for (NSString *key in proviceDic) {
        NSString *proviceValue = proviceDic[key];
        if (IS_VALID_STRING(proviceValue)) {
            if (IS_VALID_STRING(benDiProvice)) {//本地省份存在
                if ([proviceValue isEqualToString:benDiProvice]) {
                    return key;// 返回城市的id
                }
            } else {// 本地身份分不存在的话
                return @"";
            }
        }
    }
    return @"";
}


+ (NSString *)getTheAreaId
{
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"xlCity.plist" ofType:nil]];
    NSDictionary *proviceDic = dic[@"province"];
    NSDictionary *cityDic = dic[@"city"];
    NSDictionary *areaDic = dic[@"area"];
    NSString *benDiProvice = [self provice];// 本地的省份
    NSString *benDiCity = [self city];// 本地的城市
    NSString *benDiArea = [self subLocality];// 本地的区域
    for (NSString *key in proviceDic) {// 省的字典
        NSString *proviceValue = proviceDic[key];// 得到省
        if (IS_VALID_STRING(proviceValue)) {// 如果省份存在
            if (IS_VALID_STRING(benDiProvice)) {// 如果本地省份存在的话
                if ([proviceValue isEqualToString:benDiProvice]) {// 如果遍历得到的省份和本地省份相同的话找到了对应的value
                    NSDictionary *newCityDic = cityDic[key];// 得到城市的字典
                    for (NSString *cityKey in newCityDic) {
                        NSString *cityValue = newCityDic[cityKey];
                        if (IS_VALID_STRING(benDiCity)) {// 获取到城市
                            if ([cityValue isEqualToString:benDiCity]) {
                                NSDictionary *newAreaDic = areaDic[cityKey];// 得到对应的字典
                                for (NSString *xAreaKey in newAreaDic) {
                                    NSString *xAreaValue = newAreaDic[xAreaKey];
                                    if (IS_VALID_STRING(benDiArea)) {// 如果本地的区域存在的话
                                        if ([xAreaValue isEqualToString:benDiArea]) {
                                            return xAreaKey;
                                        }
                                    } else {// 没有本地的区域的话直接返回空结束循环
                                        return @"";
                                    }
                                }
                                
                            }
                            
                        } else {// 没有本地的城市的话
                            return @"";
                        }
                        
                    }
                    
                    
                }
            } else {// 没有本地的省份直接返回就好了
                return @"";
            }
        }
    }
    return @"";
}


+ (NSString *)getCityByID:(NSString *)cityId
{
    if (IS_VALID_STRING(cityId)) {
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"xlCity.plist" ofType:nil]];
        NSDictionary *cityDic = dic[@"city"];
        if (dic && [dic isKindOfClass:[NSDictionary class]] && dic.count && cityDic && [cityDic isKindOfClass:[NSDictionary class]] && cityDic.count) {// 安全操作
            NSString *cityName = cityDic[cityId];
            if (IS_VALID_STRING(cityName)) {
                return cityName;
            } else {
                return @"";
            }
        } else {
            return @"";
        }
    }
    return @"";
}

@end
