//
//  UserManager.m
//  LvJie
//
//  Created by bilin on 2017/1/5.
//  Copyright © 2017年 Bilin-Apple. All rights reserved.
//

#import "UserManager.h"

#define UserLoginKey @"XLUserLogin"
static NSString * const theKeyForGuide = @"theKeyForGuide";
@implementation UserManager
@synthesize userModel = _userModel;
- (void)setUserModel:(LoginUserModel *)userModel {
   
    if ( [[UserManager sharedManager] isLoad]) {
        _userModel = [[UserManager sharedManager] getUserInfo];
    } else {
        _userModel = nil;
    }
    
}
// 单利
+ (instancetype)sharedManager
{
    static UserManager *userManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userManager = [self new];
    });
    return userManager;
    
}


//保存用户信息
- (void)savaUserInfoWith:(LoginUserModel *)entity
{
//    NSData *data =  [FastCoder dataWithRootObject:entity];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:entity];
    if (data && [data isKindOfClass:[NSData class]]) {
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:UserLoginKey];
     BOOL issynchronise =   [[NSUserDefaults standardUserDefaults] synchronize];
//        issynchronise ? NSLog(@"同步成功") : NSLog(@"同步失败");
    } else {
        UIAlertView *aletView = [[UIAlertView alloc] initWithTitle:@"" message:@"用户登录失败" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [aletView show];
        
    }
    
}

//清空用户信息
- (void)cleanUserInfo
{
    // 清除用户信息
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:UserLoginKey];
    BOOL issynchronise =  [[NSUserDefaults standardUserDefaults] synchronize];// 同步
//    issynchronise ? NSLog(@"同步成功") : NSLog(@"同步失败");
    _userModel = nil;
}

//获取用户信息
- (LoginUserModel *)getUserInfo
{
    NSData *data = UserDefaultObjectForKey(UserLoginKey);
    _userModel =   [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if (!(_userModel && [_userModel isKindOfClass:[LoginUserModel class]])) {
        _userModel = nil;
    }
    return _userModel;
}
- (LoginUserModel *)userModel
{
    return [self getUserInfo];
}
//判断是否登录
- (BOOL)isLoad
{
    if ([self getUserInfo]) {
        return YES;
    } else {
        return NO;
    }
}


// App版本号
- (NSString *)AppVersion {
    return [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}

//是否显示新特性
- (BOOL)isDisplayGuidePage
{
    if ([self.AppVersion isEqualToString:UserDefaultObjectForKey(theKeyForGuide)]) {// 不用显示引导页
        return NO;
    }
    // 清除用户信息
    [self cleanUserInfo];
    UserDefaultSetObjectForKey(self.AppVersion, theKeyForGuide);
    UserDefaultSetObjectForKey(@"fbzx", @"XLJumpIndexTwo") // 这个是用于发布咨询的
    
    return YES;// 显示引导页
}

// 横向的缩放
- (CGFloat)horizontalScare
{
    return (kScreenWidth/320);
}
// 纵向的缩放
- (CGFloat)verticalScare
{
    return (kScreenHeight / 568);
}




@end
