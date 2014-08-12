//
//  CBViewController.m
//  CuBeaconSample
//
//  Created by CuBeacon on 8/12/14.
//  Copyright (c) 2014 Eyro. All rights reserved.
//

#import "CBViewController.h"

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
        [self.view setBackgroundColor:[UIColor whiteColor]];
        
    }];
    
    [[CBApp getInstance] setDidChangeNearestBlock:^(CBBeacon* old, CBBeacon* current){
        [self.view setBackgroundColor:current.color];
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
