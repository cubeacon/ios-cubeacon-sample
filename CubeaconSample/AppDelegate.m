//
//  AppDelegate.m
//  CubeaconSample
//
//  Created by Eyro Labs on 12/6/16.
//  Copyright © 2016 Eyro Labs. All rights reserved.
//

#import "AppDelegate.h"
#import <Cubeacon/Cubeacon.h>

@interface AppDelegate () <CBBeaconManagerDelegate>

@property (nonatomic, strong) CBBeaconManager *beaconManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
    
    // initialize Cubeacon SDK
    [Cubeacon setLogLevel:CBLogLevelDebug];
    [Cubeacon initialize];
    
    // setup scanning
    self.beaconManager = [[CBBeaconManager alloc] init];
    
    return YES;
}

- (void)didStartMonitoringForRegion:(CBRegion *)region {
    NSLog(@"Start monitoring region:%@", region);
}

- (void)monitoringDidFailForRegion:(CBRegion *)region withError:(NSError *)error {
    NSLog(@"Monitoring failed for region: %@. Make sure that Bluetooth and Location Services are on, and that Location Services are allowed for this app. Beacons require a Bluetooth Low Energy compatible device: <http://www.bluetooth.com/Pages/Bluetooth-Smart-Devices-List.aspx>. Note that the iOS simulator doesn't support Bluetooth at all. The error was: %@", region.identifier, error);
}

- (void)didEnterRegion:(CBRegion *)region {
    [self showNotificationWithMessage:@"You're entering beacon region."];
}

- (void)didExitRegion:(CBRegion *)region {
    [self showNotificationWithMessage:@"You're exiting beacon region"];
}

- (void)didDetermineState:(CBRegionState)state forRegion:(CBRegion *)region {
    
}

- (void)showNotificationWithMessage:(NSString *)message {
    UILocalNotification *notification = [UILocalNotification new];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80200// __IPHONE_8_2
    notification.alertTitle = @"Cubeacon Sample";
#endif
    notification.alertBody = message;
    notification.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    // when app entering background state, set beacon manager delegate
    // so it can trigger monitoring delegate
    self.beaconManager.delegate = self;
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
