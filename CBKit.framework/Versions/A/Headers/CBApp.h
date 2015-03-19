//
//  CBApp.h
//  CubeaconApp
//
//  Created by CuBeacon Dev. on 6/21/14.
//  Copyright (c) 2014 Eyro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBConstant.h"

@import CoreLocation;
@class CBBeacon;

/** Callback for entering a beacon.
 */
typedef void (^BeaconDidEnterBlock) (CBBeacon* beacon);

/** Callback for exiting a beacon.
 */
typedef void (^BeaconDidExitBlock) (CBBeacon* beacon, NSTimeInterval interval);

/** Callback for changing neareast beacon.
 */
typedef void (^BeaconDidChangeNearestBlock) (CBBeacon* old,CBBeacon* current);

/**
 *  Callback for detected beacon with proximity Immediate
 *
 *  @param beacon Detected beacon
 */
typedef void (^BeaconDidImmediateBlock) (CBBeacon* beacon);

/**
 *  Callback for detected beacon with proximity Near
 *
 *  @param beacon Detected beacon
 */
typedef void (^BeaconDidNearBlock) (CBBeacon* beacon);

/**
 *  Callback for detected beacon with proximity Far
 *
 *  @param beacon Detected beacon
 */
typedef void (^BeaconDidFarBlock) (CBBeacon* beacon);

/** Callback when no beacon detected.
 */
typedef void (^BeaconEmptyBlock) ();

/**
 *  Callback for nearest beacon accuracy.
 *
 *  @param range accuracy of nearest detected beacon
 */
typedef void (^BeaconNearestUpdateRange) (double range);

/** Class that handle CuBeacon application.
 */
@interface CBApp : NSObject <CLLocationManagerDelegate>

/** Kii Cloud appId
 */
@property (nonatomic,readonly) NSString* kiiAppId;

/** Kii Cloud appKey
 */
@property (nonatomic,readonly) NSString* kiiAppKey;

/** Location manager.
 */
@property (nonatomic,readonly) CLLocationManager *locationManager;

// APP setting
/** Default alert message body for all beacons.
 The content string is defined on setting file.
 */
@property (nonatomic, readonly) NSString *defaultAlertMsg;

/** Default alert message title for all beacons.
 The content string is defined on setting file.
 */
@property (nonatomic, readonly) NSString *defaultAlertTitle;

/** Enter a beacon callback.
 */
@property (nonatomic,copy) BeaconDidEnterBlock didEnterBlock;

/** Exited a beacon callback.
 */
@property (nonatomic,copy) BeaconDidExitBlock didExitBlock;

/** Changed nearest beacon callback.
 */
@property (nonatomic,copy) BeaconDidChangeNearestBlock didChangeNearestBlock;

/**
 *  Immediate proximity beacon callback
 */
@property (nonatomic,copy) BeaconDidImmediateBlock didImmediateBlock;

/**
 *  Near proximity beacon callback
 */
@property (nonatomic,copy) BeaconDidNearBlock didNearBlock;

/**
 *  Far proximity beacon callback
 */
@property (nonatomic,copy) BeaconDidFarBlock didFarBlock;

/** Empty nearest beacon callback.
 */
@property (nonatomic,copy) BeaconEmptyBlock didEmptyBlock;

/** Updated range beacon callback.
 */
@property (nonatomic,copy) BeaconNearestUpdateRange didUpdateRange;

/** Notification event type for detected beacons.
 */
@property (nonatomic,assign) CBNotificationEventType notificationEventType;

/** Notification event state for detected beacons.
 */
@property (nonatomic,assign) CBNotificationStateType notificationStateType;


/** Getting beacons data on the cloud then rewrite the local persistence.
 */
-(void) refreshBeacons;

/** Setup configuration files
 @param path path of the setting .plist file.
 @exception throw NSInvalidArgumentException if the setting file is not valid.
 */
+(void) setupWithPlist:(NSString*) path;

/** Singleton instance getter.
 */
+(instancetype) getInstance;

/** Show the debug logging provided by Cubeacon SDK
 */
+(void) enableDebugLogging;

/**Get scanned beacons.
 @return Array of CBBeacon that is to be scanned by the SDK.
 */
+(NSArray*) scannedBeacons;

/**Get SDK version String.
 @return string representation of the sdk version
 */
+(NSString*) sdkVersion;

/**Get SDK version code.
 @return integer representation of the sdk version code
 */
+(NSUInteger) sdkCode;
@end
