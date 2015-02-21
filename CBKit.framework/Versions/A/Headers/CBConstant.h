//
//  CB.h
//  CubeaconApp
//
//  Created by Eyro Labs on 1/30/15.
//  Copyright (c) 2015 Eyro. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Notification event type
 */
typedef NS_OPTIONS(NSUInteger, CBNotificationEventType){
    /**
     *  The application may not present any Notification upon any beacon event being received
     */
    CBNotificationEventTypeNone    = 0,
    /**
     *  The application display alert notification on entering beacon region
     */
    CBNotificationEventTypeOnEnter   = 1 << 0,
    /**
     *  The application display alert notification on exiting beacon region
     */
    CBNotificationEventTypeOnExit   = 1 << 1,
};

/**
 *  Notification state type
 */
typedef NS_OPTIONS(NSUInteger, CBNotificationStateType){
    /**
     *  The application display alert notification on background state
     */
    CBNotificationStateTypeOnBackground   = 1 << 0,
    /**
     *  The application display alert notification on foreground state
     */
    CBNotificationStateTypeOnForeground   = 1 << 1,
};

/**
 *  Storyline beacon event type
 */
typedef NS_OPTIONS(NSUInteger, CBEventType){
    /**
     *  Beacon event state inside (onEnter)
     */
    CBEventTypeOnEnter,
    /**
     *  Beacon event state outside (onExit)
     */
    CBEventTypeOnExit,
    /**
     *  Beacon event state in range with immediate proximity
     */
    CBEventTypeOnImmediate,
    /**
     *  Beacon event state in range with near proximity
     */
    CBEventTypeOnNear,
    /**
     *  Beacon event state in range with far proximity
     */
    CBEventTypeOnFar
};

/**
 *  Storyline campaign type
 */
typedef NS_OPTIONS(NSUInteger, CBCampaignType){
    /**
     *  Show an image brochure
     */
    CBCampaignTypeImage,
    /**
     *  Show a video campaign
     */
    CBCampaignTypeVideo,
    /**
     *  Show an html styled campaign
     */
    CBCampaignTypeHtml,
    /**
     *  Show a web page
     */
    CBCampaignTypeUrl
};


@interface CBConstant : NSObject

@end
