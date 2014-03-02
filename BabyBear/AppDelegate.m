//
//  AppDelegate.m
//  BabyBear
//
//  Created by sunil maganti on 3/1/14.
//  Copyright (c) 2014 Kvana Inc. All rights reserved.
//

#import "AppDelegate.h"
#import <FYX/FYX.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [FYX setAppId:@"498598ebfd736216c15b33acd52c3ebe8ba632571902c20f077f6842bf817d5a" appSecret:@"ee43e268d954ace96433eb545c72d20637892f3e04aa5dc70bbce09e2e6c2e33" callbackUrl:@"your://app-url"];
    
    [FYX startService:self];
    
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

/// comment for documentation
- (void)serviceStarted {
    NSLog(@"Service Started by Kris");
}

/// comment for documentation
- (void)startServiceFailed:(NSError *)error {
    NSLog(@"Service Start FAILED pls check Kris");
}



@end
