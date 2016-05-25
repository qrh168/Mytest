//
//  AppDelegate.m
//  ExeProject
//
//  Created by qrh on 16/4/21.
//  Copyright © 2016年 com.mzmoney. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (assign, nonatomic) UIBackgroundTaskIdentifier backgroundUpdateTask;
@property (nonatomic,assign) NSTimer *timer;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    if([[url scheme] isEqualToString:@"ExeProject"]){
        return YES;
    }
    return NO;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([[url scheme] isEqualToString:@"B"])
    {
        if ([[url host] isEqualToString:@"com.YouXianMing"])
        {
            /*
             query用法
             
             The query string from the URL.
             If the receiver does not conform to RFC 1808, returns nil. For example,
             in the URL http://www.example.com/index.php?key1=value1&key2=value2,
             the query string is key1=value1&key2=value2.
             */
            NSString *query = [url query];
            
            // 分割&
            NSArray *array = [query componentsSeparatedByString:@"&"];
            
            // 显示数据
            NSLog(@"%@", array);
        }
        
        return YES;
    }
    
    return NO;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    /**
     *  进入后台 让其一直执行
     */
    [self beingBackgroundUpdateTask];
    // 在这里加上你需要长久运行的代码
    _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(currentTime) userInfo:nil repeats:YES];
    
}

- (void)beingBackgroundUpdateTask
{
    self.backgroundUpdateTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundUpdateTask];// 如果在系统规定时间内任务还没有完成，在时间到之前会调用到这个方法，一般是10分钟
    }];
}



- (void)endBackgroundUpdateTask
{
    [[UIApplication sharedApplication] endBackgroundTask: self.backgroundUpdateTask];
    self.backgroundUpdateTask = UIBackgroundTaskInvalid;
    
    for (int i=0;i<100; i++) {
        sleep(1);
        NSLog(@"i=%d",i);
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
