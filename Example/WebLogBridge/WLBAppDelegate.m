//
//  WLBAppDelegate.m
//  WebLogBridge
//
//  Created by irobbin1024 on 03/16/2019.
//  Copyright (c) 2019 irobbin1024. All rights reserved.
//

#import "WLBAppDelegate.h"
#import "WLBWebLogManager.h"

@implementation WLBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [[WLBWebLogManager sharedManager] startServer];
    
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        static NSInteger i = 0;
        [[WLBWebLogManager sharedManager] sendLogWithChannel:@"Flurry" content:[NSString stringWithFormat:@"中文Channel is <font color='red'>%@</font> hello world + %ld</br>", @"Flurry", i++]];
        
        [[WLBWebLogManager sharedManager] sendLogWithChannel:@"Ali" content:[NSString stringWithFormat:@"Channel is %@ hello world + %ld</br>", @"Ali", i++]];
    }];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
