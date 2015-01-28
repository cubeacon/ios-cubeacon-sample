//
//  CBUser.h
//  CubeaconApp
//
//  Created by Eyro Labs on 1/14/15.
//  Copyright (c) 2015 Eyro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CBUser : NSObject

/**
 *  User display name
 */
@property (nonatomic, readonly) NSString *name;

/**
 *  User email
 */
@property (nonatomic, readonly) NSString *email;

/**
 *  Singleton method to get instance of CBUser
 *
 *  @return instance of CBUser
 */
+(CBUser*) currentUser;

/**
 *  Set user display name and email
 *
 *  @param name  User display name
 *  @param email User email
 */
-(void) setUserDisplayName:(NSString*)name andUserEmail:(NSString*)email;

/**
 *  Save user data to cloud
 */
-(void) saveUserData: (void (^)(BOOL success, NSString *errorMessages)) callback;

@end
