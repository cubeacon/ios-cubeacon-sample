//
//  CBViewController.m
//  CuBeaconSample
//
//  Created by CuBeacon on 8/12/14.
//  Copyright (c) 2014 Eyro. All rights reserved.
//

#import "CBViewController.h"
#import <CBKit/CBUser.h>

@interface CBViewController ()

@end

@implementation CBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[[CBApp getInstance] setDidEnterBlock:^(CBBeacon* beacon){
        [self.view setBackgroundColor:beacon.color];
    }];
    
    [[CBApp getInstance] setDidExitBlock:^(CBBeacon* beacon, NSTimeInterval interval){
        NSLog(@"Beacon `%@` exited", beacon.name);
    }];
    
    [[CBApp getInstance] setDidChangeNearestBlock:^(CBBeacon* old, CBBeacon* current){
        [self.view setBackgroundColor:current.color];
        if (current.cbStoryline.campaign == CBCampaignTypeImage) {
            // display a brochure image
        } else if (current.cbStoryline.campaign == CBCampaignTypeHtml) {
            // show html page via uiwebview
        } else if (current.cbStoryline.campaign == CBCampaignTypeUrl) {
            // open url in a uiwebview/safari browser
        } else if (current.cbStoryline.campaign == CBCampaignTypeVideo) {
            // play a video streaming
        }
    }];
    
    [[CBApp getInstance] setDidUpdateRange:^(double range){
        NSLog(@"Range: %lfm", range);
    }];
    
    [[CBApp getInstance] setDidEmptyBlock:^(){
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }];
    
    [[CBApp getInstance] setDidImmediateBlock:^(CBBeacon* beacon){
        if (beacon.cbStoryline.campaign == CBCampaignTypeImage) {
            // display a brochure image
        } else if (beacon.cbStoryline.campaign == CBCampaignTypeHtml) {
            // show html page via uiwebview
        } else if (beacon.cbStoryline.campaign == CBCampaignTypeUrl) {
            // open url in a uiwebview/safari browser
        } else if (beacon.cbStoryline.campaign == CBCampaignTypeVideo) {
            // play a video streaming
        }
    }];
    
    [[CBApp getInstance] setDidNearBlock:^(CBBeacon* beacon){
        if (beacon.cbStoryline.campaign == CBCampaignTypeImage) {
            // display a brochure image
        } else if (beacon.cbStoryline.campaign == CBCampaignTypeHtml) {
            // show html page via uiwebview
        } else if (beacon.cbStoryline.campaign == CBCampaignTypeUrl) {
            // open url in a uiwebview/safari browser
        } else if (beacon.cbStoryline.campaign == CBCampaignTypeVideo) {
            // play a video streaming
        }
    }];
    
    [[CBApp getInstance] setDidFarBlock:^(CBBeacon* beacon){
        if (beacon.cbStoryline.campaign == CBCampaignTypeImage) {
            // display a brochure image
        } else if (beacon.cbStoryline.campaign == CBCampaignTypeHtml) {
            // show html page via uiwebview
        } else if (beacon.cbStoryline.campaign == CBCampaignTypeUrl) {
            // open url in a uiwebview/safari browser
        } else if (beacon.cbStoryline.campaign == CBCampaignTypeVideo) {
            // play a video streaming
        }
    }];
}

-(void)updateMetaUser{
    [[CBUser currentUser] setUserDisplayName:@"User display name" andUserEmail:@"username@email.com"];
    [[CBUser currentUser] saveUserData:^(BOOL success, NSString *errorMessages) {
        if (success) {
            NSLog(@"Save meta user succeed...");
        } else {
            NSLog(@"Save meta user failed: %@", errorMessages);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
