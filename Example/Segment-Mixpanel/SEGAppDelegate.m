//
//  SEGAppDelegate.m
//  Segment-Mixpanel
//
//  Created by Prateek Srivastava on 11/06/2015.
//  Copyright (c) 2015 Prateek Srivastava. All rights reserved.
//

#import "SEGAppDelegate.h"
#import <Analytics/SEGAnalytics.h>
#import <Segment-Mixpanel/SEGMixpanelIntegrationFactory.h>

@implementation SEGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    // Override point for customization after application launch.
    [SEGAnalytics debug:YES];
    SEGAnalyticsConfiguration *config = [SEGAnalyticsConfiguration configurationWithWriteKey:@"YOUR_WRITE_KEY_HERE"];

    // Add any of your bundled integrations.
    config.trackApplicationLifecycleEvents = YES;
    config.flushAt = 1;
    [config use:[SEGMixpanelIntegrationFactory instance]];
    [SEGAnalytics setupWithConfiguration:config];

    [[SEGAnalytics sharedAnalytics] track:@"Mixpanel Application Launched"];

    [[SEGAnalytics sharedAnalytics] identify:@"segment-fake-tester-Mixpanel"
                                      traits:@{ @"email": @"tool@fake-segment-tester.com" }];

    [[SEGAnalytics sharedAnalytics] group:@"testversion1" traits:@{ @"name": @"test group"}];


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
