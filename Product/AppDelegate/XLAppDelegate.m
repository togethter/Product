//
//  XLAppDelegate.m
//  Product
//
//  Created by 李学良 on 2018/10/19.
//  Copyright © 2018年 李学良. All rights reserved.
//

#import "XLAppDelegate.h"
#import "DateViewController.h"
#import "LocationViewController.h"
#import "ConcreteProxy.h"
#import "TalkViewController.h"
#import "NHBaseNavigationController.h"
@implementation XLAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    return YES;
}

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    ConcreteProxy *proxy = [ConcreteProxy alloc];
    proxy.delegate       = self;
    
    [proxy helloWorld];
    [proxy goodBye];
    TalkViewController *VC = [[TalkViewController alloc] init];
    NHBaseNavigationController *navc = [[NHBaseNavigationController alloc] initWithRootViewController:VC];
    self.window.rootViewController = navc;
    return YES;
}
- (void)helloWorld {
    
    NSLog(@"xxxxxx");
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  

}

- (UIInterfaceOrientationMask)application:(UIApplication*)application
  supportedInterfaceOrientationsForWindow:(UIWindow*)window {
  
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
