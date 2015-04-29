//
//  CBStoryline.h
//  CubeaconApp
//
//  Created by Eyro Labs on 1/30/15.
//  Copyright (c) 2015 Eyro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CBConstant.h"

@interface CBStoryline : NSObject{
    UIImage* _brochureImage;
}
/**
 *  Storyline ID
 */
@property (nonatomic, readonly) NSString *storylineId;
/**
 *  Storyline title
 */
@property (nonatomic, readonly) NSString *storylineTitle;
/**
 *  Storyline detail ID
 */
@property (nonatomic, readonly) NSString *storylineDetailId;
/**
 *  Event type of storyline
 */
@property (nonatomic, readonly) CBEventType event;
/**
 *  Campaign type of storyline
 */
@property (nonatomic, readonly) CBCampaignType campaign;
/**
 *  Action title for notification on background
 */
@property (nonatomic, readonly) NSString *alertTitle;
/**
 *  Message body for notification on background
 */
@property (nonatomic, readonly) NSString *alertMessage;
/**
 *  Image brochure campaign
 */
@property (nonatomic, readonly) UIImage *brochureImage;
/**
 *  URL web page campaign
 */
@property (nonatomic, readonly) NSString *urlPage;
/**
 *  URL Video to stream campaign
 */
@property (nonatomic, readonly) NSURL *urlVideo;
/**
 *  HTML formatted content campaign
 */
@property (nonatomic, readonly) NSString *htmlContent;
/**
 *  Storyline show on day by name
 */
@property (nonatomic, readonly) NSDictionary *showOn;

@end
