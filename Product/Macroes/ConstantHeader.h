//
//  ConstantHeader.h
//  XLDemo
//
//  Created by bilin on 16/8/11.
//  Copyright © 2016年 lixueliang. All rights reserved.
//存放一些尺寸,像屏幕宽度, 高度; 或者一些颜色

#ifndef ConstantHeader_h
#define ConstantHeader_h
// Include any system framework and library headers here that should be included in all compilation units.
// You will also need to set the Prefix Header build setting of one or more of your targets to reference this file.

//#endif /* PrefixHeader_pch */

//----------------------ABOUT SCREEN & SIZE 屏幕&尺寸 ----------------------------
/**
 iPad Air {{0, 0}, {768, 1024}}
 iphone4s {{0, 0}, {320, 480}}     960*640
 iphone5 5s {{0, 0}, {320, 568}}      1136*640
 iphone6 6s {{0, 0}, {375, 667}}     1334*750
 iphone6Plus 6sPlus {{0, 0}, {414, 736}}  1920*1080
 Apple Watch 1.65inches(英寸) 320*640
 */
#define IPHONE4SHEIGHT [UIScreen mainScreen].bounds.size.height == 480//iphone4s 屏幕高
#define IPHONE5HEIGHT  [UIScreen mainScreen].bounds.size.height == 568//iphone5 屏幕高
#define IPHONE6PHEIGHT [UIScreen mainScreen].bounds.size.height == 736//iphone6p 屏幕高
#define IPHONE6HEIGHT [UIScreen mainScreen].bounds.size.height == 667//iphone6 屏幕高
#define LineBackgroundColor RGBCOLOR(234,239,241)
#define BACKCOLOR RGBCOLOR(245, 248, 250)//所有背景色
#define MainColor ([UIColor colorWithRed:0.000 green:0.552 blue:1.000 alpha:1.000])
#define BUTTONCOLOR RGBCOLOR(0, 177, 255);
/** 用户端*/
#define kUserDuan [USERTYPE isEqualToString:@"1"]
/** 律师段*/
#define kLawyerDuan [USERTYPE isEqualToString:@"2"]


#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kTabBarH        49.0f
#define kStatusBarH     20.0f
#define kNavigationBarH iPhoneX ? 88 : 44.0f
#define SCREEN_POINT (float)kScreenWidth/320.f
#define SCREEN_H_POINT (float)kScreenHeight/480.f

//判断是否 Retina屏、设备是否iPhone 5、是否是iPad
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/** 判断是否为iPhone */
#define isiPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

/** 判断是否是iPad */
#define isiPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

/** 判断是否为iPod */
#define isiPod ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

/** 设备是否为iPhone 4/4S 分辨率320x480，像素640x960，@2x */
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 5C/5/5S 分辨率320x568，像素640x1136，@2x */
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 分辨率375x667，像素750x1334，@2x */
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/** 设备是否为iPhone 6 Plus 分辨率414x736，像素1242x2208，@3x */
#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

//2436 x 1125    375 812
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)


//----------------------ABOUT SYSTYM & VERSION 系统与版本 ----------------------------
//Get the OS version.       判断操作系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
// 状态栏(statusbar)
#define State_barHeight [[UIApplication sharedApplication] statusBarFrame].size.height;

//judge the simulator or hardware device        判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif


/** 获取系统版本 */
#define iOS_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])

/** 是否为iOS6 */
#define iOS6 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) ? YES : NO)
/** 正好是IOS7*/
#define xlIOS7 (([[[UIDevice currentDevice] systemVersion] floatValue] == 7.0) ? YES : NO)
/** 是否为iOS7 */
#define iOS71 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? YES : NO)

/** 是否为iOS8 */
#define iOS8 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? YES : NO)

/** 是否为iOS9 */
#define iOS9 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? YES : NO)

/** 是否为iOS10 */
#define iOS10 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) ? YES : NO)
#define iOS11 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) ? YES : NO)

#define FontName  iOS9 ? @"PingFang-SC-Light" : @"Heiti SC"

#define nameColor  RGBCOLOR(131, 136, 143)// 名字// 之前的名字的颜色为 没有加急之前 -RGBCOLOR(131, 136, 143)
#define timeOrLocationColor RGBCOLOR(211, 222, 227)// 位置， 时间  没有加急之前 - RGBCOLOR(211, 222, 227)
#define xlRewardColor RGBCOLOR(255, 157, 18)
#define kZheSeDiaoColor   RGBCOLOR(0, 177, 255)// 咨询类型的颜色  没有加急之前 - RGBCOLOR(0, 177, 255)
#define desColor    RGBCOLOR(8, 19, 31)// 问题描述的颜色 没有加急之前 - RGBCOLOR(8, 19, 31)
#define ProblemComplementDesColor RGBCOLOR(131, 136, 143)// 问题补充 没有加急之前 -  RGBCOLOR(131, 136, 143
#define subChildenDesColor RGBCOLOR(131, 136, 143)// 子cell的des的颜色 没有加急之前 - RGBCOLOR(131, 136, 143)
#define xlDetailCount 2// 问题详情里面的有几个12横向的边界距离
/** 获取当前语言 */
#define kCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
//----------------------ABOUT COLOR 颜色相关 ----------------------------
//ios10 新颜色属性
#define RGB3COLOR(r,g,b) [UIColor colorWithDisplayP3Red:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1];

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define kClearColor [UIColor clearColor]
#define kRandomColor  [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0]

#define COLOR_BLUE_             UIColorFromRGB(0x41CEF2)
#define COLOR_GRAY_             UIColorFromRGB(0xababab) //171
#define COLOR_333               UIColorFromRGB(0x333333) //51
#define COLOR_666               UIColorFromRGB(0x666666) //102
#define COLOR_888               UIColorFromRGB(0x888888) //136
#define COLOR_999               UIColorFromRGB(0x999999) //153
#define COLOR_PLACEHOLD_        UIColorFromRGB(0xc5c5c5) //197
#define COLOR_RED_              UIColorFromRGB(0xff5400) //红色
#define COLOR_GREEN_            UIColorFromRGB(0x31d8ab)//绿色
#define COLOR_YELLOW_           UIColorFromRGB(0xffa200)//黄色
#define COLOR_SEPARATE_LINE     UIColorFromRGB(0xC8C8C8)//200
#define COLOR_LIGHTGRAY         COLOR(200, 200, 200, 0.4)//淡灰色

#define MAX_WIDTH_10        (kScreenWidth-20)
#define MAX_WIDTH_15        (kScreenWidth-30)

#define kScreenWidthRatio  (kScreenWidth / 375.0)
#define kScreenHeightRatio (kScreenHeight / 667.0)
#define AdaptedWidthValue(x)  (ceilf((x) * kScreenWidthRatio))
#define AdaptedHeightValue(x) (ceilf((x) * kScreenHeightRatio))
#define kUHSystemFontWithSize(R)    [UIFont systemFontOfSize:(AdaptedWidthValue(R))]

#define IPhoneXBottomV        30   //距离下部间距  iphonex

//----------------------ABOUT IMAGE 图片 ----------------------------

//LOAD LOCAL IMAGE FILE     读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]


//DEFINE IMAGE      定义UIImage对象//    imgView.image = IMAGE(@"Default.png");

#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//DEFINE IMAGE      定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]

//BETTER USER THE FIRST TWO WAY, IT PERFORM WELL. 优先使用前两种宏定义,性能高于后面.


//----------------------SOMETHING ELSE 其他 ----------------------------

#define intToStr(S)    [NSString stringWithFormat:@"%d",S]

//
//#define NotificationWarning(msg) [JDStatusBarNotification showWithStatus:msg dismissAfter:2.0 styleName:JDStatusBarStyleWarning]
//
//#define NotificationError(msg) [JDStatusBarNotification showWithStatus:msg dismissAfter:2.0 styleName:JDStatusBarStyleError]
//
//#define NotificationSuccess(msg) [JDStatusBarNotification showWithStatus:msg dismissAfter:2.0 styleName:JDStatusBarStyleSuccess]


/**
 *  the saving objects      存储对象
 *
 *  @param __VALUE__ V
 *  @param __KEY__   K
 *
 *  @return
 */
#define UserDefaultSetObjectForKey(__VALUE__,__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] setObject:__VALUE__ forKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

/**
 *  get the saved objects       获得存储的对象
 */
#define UserDefaultObjectForKey(__KEY__)  [[NSUserDefaults standardUserDefaults] objectForKey:__KEY__]

/**
 *  delete objects      删除对象
 */
#define UserDefaultRemoveObjectForKey(__KEY__) \
{\
[[NSUserDefaults standardUserDefaults] removeObjectForKey:__KEY__];\
[[NSUserDefaults standardUserDefaults] synchronize];\
}

#define xlState ([L_state isEqualToString:@"1"] || [L_state isEqualToString:@"4"] || [L_state isEqualToString:@"2"] )


#define xltiaozhuanma \
{\
if (xlState) {\
    [AlertBox JumpLawyerAuthenticationAlertBox:self];\
    return;\
}\
}\


// 隐藏底部的tableBarView
#define hiddenBottomTableBarView(VC)\
{\
if ([USERTYPE isEqualToString:@"1"]) {\
\
} else { \
VC.hidesBottomBarWhenPushed = YES;\
}\
}\


/**
 *
 * 获取/Documents/data.plist 路径
 */
#define PLIST_TICKET_INFO_EDIT [NSHomeDirectory() stringByAppendingString:@"/Documents/data.plist"] //edit the plist

#define TableViewCellDequeueInit(__INDETIFIER__) [tableView dequeueReusableCellWithIdentifier:(__INDETIFIER__)];

#define TableViewCellDequeue(__CELL__,__CELLCLASS__,__INDETIFIER__) \
{\
if (__CELL__ == nil) {\
__CELL__ = [[__CELLCLASS__ alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:__INDETIFIER__];\
}\
}
/**
 *  KEYWindow
 *
 *  @return window
 */
#define KEYWINDOW [UIApplication sharedApplication].keyWindow

//Show Alert, brackets is the parameters.       宏定义一个弹窗方法,括号里面是方法的参数
#define ShowAlert    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning." message:nil delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: @"OK"];[alert show];


/**define an API 定义一个API*/
#define APIURL                @"http://www.google.com"
/**login the API 登陆API*/
#define APILogin              [APIURL stringByAppendingString:@"Login"]


/**全局队列GCD*/
#define GCDWithGlobal(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

/** 主队列GCD*/
#define GCDWithMain(block) dispatch_async(dispatch_get_main_queue(),block)

/**NSUserDefaults 实例化*/
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define XFSW(w) ((w)*((float)kScreenWidth/375.f))
#define XFSH(h) ((h)*((float)kScreenHeight/667.f))
/**单例化 一个类*/
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}
/** 快速查询一段代码的执行时间 */
/** 用法
 TICK
 do your work here
 TOCK
 */
#define TICK NSDate *startTime = [NSDate date];
#define TOCK NSLog(@"Time:%f", -[startTime timeIntervalSinceNow]);

#endif /* ConstantHeader_h */
