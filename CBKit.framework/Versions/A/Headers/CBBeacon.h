//
//  CBBeacon.h
//  CubeaconApp
//
//  Created by CuBeacon Dev. on 7/26/14.
//  Copyright (c) 2014 Eyro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CLBeacon;
@class CBStoryline;

/** Class for iBeacon representation.
 */
@interface CBBeacon : NSObject

/** CuBeacon beacon name.
 The value is defined by the cloud.
 */
@property(nonatomic,readonly) NSString *name;

/** Beacon proximity UUID.
 The value is defined by scanned beacon.
 */
@property(nonatomic,readonly) NSString *proximityUUID;

/** Beacon major value.
 The value is defined by scanned beacon.
 */
@property(nonatomic,readonly) NSInteger major;

/** Beacon minor value.
 The value is defined by scanned beacon.
 */
@property(nonatomic,readonly) NSInteger minor;

/** CuBeacon Id.
 The value is defined by the cloud.
 */
@property(nonatomic,readonly) NSString *cbId;

/**
 The value is defined by the cloud.
 */
@property(nonatomic,readonly) UIColor *color;

/** Raw CLBeacon instance scanned by iOS.
 */
@property(nonatomic,readonly) CLBeacon *clBeacon;

/** Raw CBStoryline instance when detected by scanning
 */
@property(nonatomic,readonly) CBStoryline *cbStoryline;

@end
