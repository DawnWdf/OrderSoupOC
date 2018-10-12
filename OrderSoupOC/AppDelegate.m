//
//  AppDelegate.m
//  OrderSoupOC
//
//  Created by Dawn Wang on 2018/10/9.
//  Copyright © 2018年 Dawn Wang. All rights reserved.
//

#import "AppDelegate.h"
#import <OrderSoupKit/OrderSoupKit.h>
#import "OSSiriAuthorizationManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [OSSiriAuthorizationManager os_siriAuthorizationStatus];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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



// Called on the main thread as soon as the user indicates they want to continue an activity in your application. The NSUserActivity object may not be available instantly,
// so use this as an opportunity to show the user that an activity will be continued shortly.
// For each application:willContinueUserActivityWithType: invocation, you are guaranteed to get exactly one invocation of application:continueUserActivity: on success,
// or application:didFailToContinueUserActivityWithType:error: if an error was encountered.
- (BOOL)application:(UIApplication *)application willContinueUserActivityWithType:(NSString *)userActivityType NS_AVAILABLE_IOS(8_0) {
 
    return YES;
}

// Called on the main thread after the NSUserActivity object is available. Use the data you stored in the NSUserActivity object to re-create what the user was doing.
// You can create/fetch any restorable objects associated with the user activity, and pass them to the restorationHandler. They will then have the UIResponder restoreUserActivityState: method
// invoked with the user activity. Invoking the restorationHandler is optional. It may be copied and invoked later, and it will bounce to the main thread to complete its work and call
// restoreUserActivityState on all objects.
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray<id<UIUserActivityRestoring>> * __nullable restorableObjects))restorationHandler NS_AVAILABLE_IOS(8_0) {
    
    if ([userActivity.activityType isEqualToString:@"OrderSoupIntent"]){
        OSOrder *order = [[OSOrder alloc] init];
        INInteraction *interaction = userActivity.interaction;
        if (interaction) {
            [order configOrderWith:(OrderSoupIntent *)interaction.intent];
        }
        //拿到了order可以干别的了
    }
    

    restorationHandler([(UINavigationController *)self.window.rootViewController viewControllers]);
    return YES;
}

// If the user activity cannot be fetched after willContinueUserActivityWithType is called, this will be called on the main thread when implemented.
- (void)application:(UIApplication *)application didFailToContinueUserActivityWithType:(NSString *)userActivityType error:(NSError *)error NS_AVAILABLE_IOS(8_0) {
    NSLog(@"%s",__func__);

}

// This is called on the main thread when a user activity managed by UIKit has been updated. You can use this as a last chance to add additional data to the userActivity.
- (void)application:(UIApplication *)application didUpdateUserActivity:(NSUserActivity *)userActivity NS_AVAILABLE_IOS(8_0){
    NSLog(@"%s",__func__);
}
@end
