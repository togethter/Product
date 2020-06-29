//
//  LocationViewController.m
//  Product
//
//  Created by 李学良 on 2018/10/20.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "LocationViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "ScrollowManager.h"
@interface LocationViewController ()<CLLocationManagerDelegate>
@property (nonatomic,strong) CLLocationManager *locationManger;


@property (nonatomic, strong) UILabel *label;
@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    return;
    self.label = [UILabel new];
    [self.view addSubview:self.label];
    
    self.label.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
    self.label.center = self.view.center;

    self.locationManger = [[CLLocationManager alloc] init];
    self.locationManger.delegate = self;
#if 1
    if ([CLLocationManager locationServicesEnabled]) {// 用户设备支持定位服务
        switch ([CLLocationManager authorizationStatus]) {
            case kCLAuthorizationStatusNotDetermined:// 用于没有选择
            {
                [self.locationManger requestWhenInUseAuthorization];
            }
                break;
            case kCLAuthorizationStatusDenied:// 用户明确拒绝或者设置中的服务关闭中
            case kCLAuthorizationStatusRestricted:// 用户关闭了服务
            {
                NSLog(@"关闭了位置服务");
            }
            case kCLAuthorizationStatusAuthorizedWhenInUse:// 前台中定位
            case kCLAuthorizationStatusAuthorizedAlways:// 前后台都可以定位
            {
                //            extern const kCLLocationAccuracyBestForNavigation API_AVAILABLE(ios(4.0), macos(10.7));导航类的APP
                //            extern const CLLocationAccuracy kCLLocationAccuracyBest;最好的精度
                //            extern const CLLocationAccuracy kCLLocationAccuracyNearestTenMeters;10m
                //            extern const CLLocationAccuracy kCLLocationAccuracyHundredMeters; 100m
                //            extern const CLLocationAccuracy kCLLocationAccuracyKilometer;1000m
                //            extern const CLLocationAccuracy kCLLocationAccuracyThreeKilometers 3000m
                self.locationManger.desiredAccuracy = kCLLocationAccuracyBest;// 定位精度精确到100m
                self.locationManger.distanceFilter = kCLDistanceFilterNone;// 水平移动的距离最小100m才跟新位置
                self.locationManger.delegate = self;
                [self.locationManger startUpdatingLocation];// 开启位置更新
            }
            default:
                break;
        }
        //    device capabilities key （其他的服务）
    } else {
#pragma mark - 用户设备不支持定位服务
    }
#endif

    [self escalateLocationServiceAuthorization];

}
- (void)moitorBeacons
{
    if ([CLLocationManager isMonitoringAvailableForClass:[CLBeaconRegion class]]) {
        NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString:@"39ED98FF-2900-441A-802F-9C398FC199D2"];
        NSString *beacoid = @"com.example.myBeaconRegion";
       CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:proximityUUID identifier:beacoid];
        [self.locationManger startMonitoringForRegion:region];
    }
}

- (void)monitorRegionAtLocation:(CLLocationCoordinate2D)center identifer:(NSString *)identifer
{
    if (CLLocationManager.authorizationStatus == kCLAuthorizationStatusAuthorizedAlways) {
        if ([CLLocationManager isMonitoringAvailableForClass:[self class]]) {
            CLLocationDistance distance =  self.locationManger.maximumRegionMonitoringDistance;
            CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:center radius:distance identifier:identifer];
            region.notifyOnEntry = YES;
            region.notifyOnExit = NO;
            [self.locationManger startMonitoringForRegion:region];
        }
    }
}

// 重要位置更新服务
- (void)startReceivingSingificatLocationChanges
{
    if (CLLocationManager.authorizationStatus != kCLAuthorizationStatusAuthorizedAlways) {
        // User has not authorized access to location information.
        return;
    }
    if (![CLLocationManager significantLocationChangeMonitoringAvailable]) {
        // The service is not available.
        return;
    }
    
    self.locationManger.delegate = self;
    self.locationManger.pausesLocationUpdatesAutomatically = YES;// 在用户不太可能移动的时候暂停位置更新
    self.locationManger.activityType  = CLActivityTypeFitness;// 暂时选这个？？？
    [self.locationManger startMonitoringSignificantLocationChanges];
}

//访问服务是收集位置数据的最有效的方式。通过该服务，系统仅在用户的动作值得注意时提供位置更新。每个更新包括位置和在那个位置上花费的时间量。此服务并不用于导航或其他实时活动，但是您可以用来识别用户行为中的模式，并将这些知识应用于应用程序的其他部分。例如，如果用户在正常的锻炼时间到达健身房，音乐应用程序可以准备一个健身房播放列表
- (void)startReceivingVisitChanges
{
    if (CLLocationManager.authorizationStatus != kCLAuthorizationStatusAuthorizedAlways) {
        // User has not authorized access to location information.
        return;
    }
    if (CLLocationManager.locationServicesEnabled == NO) {
        // This service is not available.
        return;
    }
    self.locationManger.pausesLocationUpdatesAutomatically = YES;
    self.locationManger.activityType = CLActivityTypeFitness;
    [self.locationManger startMonitoringVisits];
}

// iOS 11 之后可以授权总是访问授权让用户自己选择
- (void)escalateLocationServiceAuthorization
{
    if (CLLocationManager.authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManger requestAlwaysAuthorization];
    }
}

/*
 *  locationManager:didUpdateToLocation:fromLocation:
 *
 *  Discussion:
 *    Invoked when a new location is available. oldLocation may be nil if there is no previous location
 *    available.
 *
 *    This method is deprecated. If locationManager:didUpdateLocations: is
 *    implemented, this method will not be called.
 */
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation API_AVAILABLE(macos(10.6)) API_DEPRECATED("Implement -locationManager:didUpdateLocations: instead", ios(2.0, 6.0)) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);
}

/*
 *  locationManager:didUpdateLocations:
 *
 *  Discussion:
 *    Invoked when new locations are available.  Required for delivery of
 *    deferred locations.  If implemented, updates will
 *    not be delivered to locationManager:didUpdateToLocation:fromLocation:
 *
 *    locations is an array of CLLocation objects in chronological order.
 */
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations API_AVAILABLE(ios(6.0), macos(10.9))
{
    NSLog(@"%s,%d authorizationStatus %d",__func__,__LINE__ ,[CLLocationManager authorizationStatus]);
    CLLocation *location = locations.lastObject;// 最后一次的定位信息
    

    NSLog(@"%f,%f,位置高度%f,精度和纬度构成的圆的半径负数无效%f,高度值的精度以米为单位测量负数无效%f,装置的瞬时速度以每秒计%f,装置的行进方向以度数和相对于正北的方向测量%f",location.coordinate.latitude,location.coordinate.longitude,location.altitude,location.horizontalAccuracy,\
          location.verticalAccuracy,location.speed,location.course);
    self.label.text =  [NSString stringWithFormat:@"%f,%f",location.coordinate.latitude,location.coordinate.longitude];
    self.label.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(255)/ 255.0) green:(arc4random_uniform(255) / 255.0) blue:(arc4random_uniform(255) / 255.0) alpha:1.0];

}

/*
 *  locationManager:didUpdateHeading:
 *
 *  Discussion:
 *    Invoked when a new heading is available.
 */
- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading API_AVAILABLE(ios(3.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);

}

/*
 *  locationManagerShouldDisplayHeadingCalibration:
 *
 *  Discussion:
 *    Invoked when a new heading is available. Return YES to display heading calibration info. The display
 *    will remain until heading is calibrated, unless dismissed early via dismissHeadingCalibrationDisplay.
 */
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager  API_AVAILABLE(ios(3.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);
    return YES;
}

/*
 *  locationManager:didDetermineState:forRegion:
 *
 *  Discussion:
 *    Invoked when there's a state transition for a monitored region or in response to a request for state via a
 *    a call to requestStateForRegion:.
 */
- (void)locationManager:(CLLocationManager *)manager
      didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region API_AVAILABLE(ios(7.0), macos(10.10)) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);
  
}

/*
 *  locationManager:didRangeBeacons:inRegion:
 *
 *  Discussion:
 *    Invoked when a new set of beacons are available in the specified region.
 *    beacons is an array of CLBeacon objects.
 *    If beacons is empty, it may be assumed no beacons that match the specified region are nearby.
 *    Similarly if a specific beacon no longer appears in beacons, it may be assumed the beacon is no longer received
 *    by the device.
 */
- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray<CLBeacon *> *)beacons inRegion:(CLBeaconRegion *)region API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);
    
    if (beacons.count){
        CLBeacon *beacon = beacons.firstObject;
    }
}

/*
 *  locationManager:rangingBeaconsDidFailForRegion:withError:
 *
 *  Discussion:
 *    Invoked when an error has occurred ranging beacons in a region. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager
rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region
              withError:(NSError *)error API_AVAILABLE(ios(7.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);
}

/*
 *  locationManager:didEnterRegion:
 *
 *  Discussion:
 *    Invoked when the user enters a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region API_AVAILABLE(ios(4.0), macos(10.8)) API_UNAVAILABLE(watchos, tvos)
{
    if ([region isKindOfClass:[CLCircularRegion class]]) {
        NSString *identifier = region.identifier;
//        triggerTaskAssociatedWithRegionIdentifier(identifier);
        
    }
    if ([region isKindOfClass:[CLBeaconRegion class]]) {
        if ([CLLocationManager isRangingAvailable]) {
            [manager startRangingBeaconsInRegion:(CLBeaconRegion *)region];
            // Store the beacon so that ranging can be stopped on demand.
//            beaconsToRange.append(region as! CLBeaconRegion)
            
        
        }
    }
    
    
    NSLog(@"%s,%d",__func__,__LINE__);
    NSLog(@"%@,%d,%d",region.identifier,region.notifyOnExit,region.notifyOnEntry);
//    [region containsCoordinate:nil]
}

/*
 *  locationManager:didExitRegion:
 *
 *  Discussion:
 *    Invoked when the user exits a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
- (void)locationManager:(CLLocationManager *)manager
          didExitRegion:(CLRegion *)region API_AVAILABLE(ios(4.0), macos(10.8)) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);
}

/*
 *  locationManager:didFailWithError:
 *
 *  Discussion:
 *    Invoked when an error has occurred. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"%s,%d",__func__,__LINE__);
    
    if (error && error.code == kCLAuthorizationStatusDenied) {
        [manager stopMonitoringSignificantLocationChanges];// 停止更新
        [manager stopUpdatingLocation];// 停止更新位置信息
        [manager stopMonitoringVisits];// 关闭vist
    }
    
#pragma mark - 告诉用户errors
}

/*
 *  locationManager:monitoringDidFailForRegion:withError:
 *
 *  Discussion:
 *    Invoked when a region monitoring error has occurred. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager
monitoringDidFailForRegion:(nullable CLRegion *)region
              withError:(NSError *)error API_AVAILABLE(ios(4.0), macos(10.8)) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);
}

/*
 *  locationManager:didChangeAuthorizationStatus:
 *
 *  Discussion:
 *    Invoked when the authorization status changes for this application.
 */
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status API_AVAILABLE(ios(4.2), macos(10.7))
{
    NSLog(@"%s,%d",__func__,__LINE__);

    switch (status) {
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied:
        {
            NSLog(@"地理位置被禁用");
        }
            break;
            case kCLAuthorizationStatusAuthorizedWhenInUse:
            case kCLAuthorizationStatusAuthorizedAlways:
        {
            NSLog(@"地理位置被开启");
            // showMyWhenInUseFeatures
        }
            break;
            case kCLAuthorizationStatusNotDetermined:
        {
            NSLog(@"未决定");
        }
        default:
            break;
    }
}

/*
 *  locationManager:didStartMonitoringForRegion:
 *
 *  Discussion:
 *    Invoked when a monitoring for a region started successfully.
 */
- (void)locationManager:(CLLocationManager *)manager
didStartMonitoringForRegion:(CLRegion *)region API_AVAILABLE(ios(5.0), macos(10.8)) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);
}

/*
 *  Discussion:
 *    Invoked when location updates are automatically paused.
 */
- (void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager API_AVAILABLE(ios(6.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);
}

/*
 *  Discussion:
 *    Invoked when location updates are automatically resumed.
 *
 *    In the event that your application is terminated while suspended, you will
 *      not receive this notification.
 */
- (void)locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager API_AVAILABLE(ios(6.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);
}

/*
 *  locationManager:didFinishDeferredUpdatesWithError:
 *
 *  Discussion:
 *    Invoked when deferred updates will no longer be delivered. Stopping
 *    location, disallowing deferred updates, and meeting a specified criterion
 *    are all possible reasons for finishing deferred updates.
 *
 *    An error will be returned if deferred updates end before the specified
 *    criteria are met (see CLError), otherwise error will be nil.
 */
- (void)locationManager:(CLLocationManager *)manager
didFinishDeferredUpdatesWithError:(nullable NSError *)error API_AVAILABLE(ios(6.0), macos(10.9)) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);
}

/*
 *  locationManager:didVisit:
 *
 *  Discussion:
 *    Invoked when the CLLocationManager determines that the device has visited
 *    a location, if visit monitoring is currently started (possibly from a
 *    prior launch).
 */
- (void)locationManager:(CLLocationManager *)manager didVisit:(CLVisit *)visit API_AVAILABLE(ios(8.0)) API_UNAVAILABLE(macos) API_UNAVAILABLE(watchos, tvos)
{
    NSLog(@"%s,%d",__func__,__LINE__);
    NSLog(@"纬度%f,精度%f,指定坐标的水平精度%f,用户到达指定位置的大致时间%@,用户离开指定位置的大致时间%@",visit.coordinate.latitude,visit.coordinate.longitude,visit.horizontalAccuracy\
          ,visit.arrivalDate,visit.departureDate);
#pragma mark - vist 相关
}
@end
