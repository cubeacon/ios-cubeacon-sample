# Cubeacon Sample iOS Project #

This repository is reserved for iOS Cubeacon SDK Demos app.

## Cubeacon SDK Overview ##
Cubeacon SDK for iOS is a library to allow interaction with any iBeacons. The SDK system requirements are iOS 7 or above and Bluetooth Low Energy. 

**Cubeacon SDK allows for :**

  - Integrating with Cubeacon SaaS
  - Scanning any beacons on a foreground UI or on background as a service
  - Showing alert (foreground) or notifications (background) when any beacons entered region `setDidEnterBlock`, exited region `setDidExitBlock` and nearest detected `setDidChangeNearestBlock`
  - Showing scenario based on beacons detected
  - Sending analytic to Cubeacon SaaS

**Cubeacon Link :**
 - [Cubeacon Software as a Service][CubeaconSaaS]
 - [iOS Apple Documentation][AppleDoc]
 - [Provide us Comments][Issue]

## Cubeacon SDK Installation ##
1. Download the framework and drag in into the 'Frameworks' section in your XCode project.
2. Ensure the following frameworks and a library exist in your project :
   - libsqlite3.dylib
3. Extract `CubeaconSDK-iOS-xxx.zip`, drag in `Cubeacon.plist` to Xcode project.
4. Then drag in `CuBeacon.framework` into the `Frameworks` section in your XCode project.
5. Add the following code to initialize Cubeacon SDK in your AppDelegate's `application:didFinishLaunchingWithOptions` method :

    ```ios
    - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
    {
        // enable Cubeacon SDK to show notification
        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert categories:[NSSet setWithObject:@"BeaconsNotification"]];
        [application registerUserNotificationSettings:setting];
    
        // init Cubeacon SDK with plist file
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Cubeacon" ofType:@"plist"];
        [CBApp setupWithPlist:plistPath];
        [[CBApp getInstance] refreshBeacons];
        // enable this line below if on development mode
        [CBApp enableDebugLogging];
        
        return YES;
    }
    ```
7. Don't forget to add the following header to all files that will use Cubeacon SDK :

    ```ios
    #import <CBKit/CBKit.h>
    ```
8. Open your project settings and go to the `Capabilities` tab. Setting like this screenshot below :

    ![Add Capabilities](./capabilities.png)

## Usage and Demos ##
You can import `Cubeacon SDK Demos` that located in this repo to your XCode project. 

Then, on `ViewController` of your apps :
```ios
    - (void)viewDidLoad
    {
        [super viewDidLoad];
        [[CBApp getInstance] setDidEnterBlock:^(CBBeacon* beacon){
            // do something when beacon entered region, ex: change background color
        }];
        
        [[CBApp getInstance] setDidExitBlock:^(CBBeacon* beacon, NSTimeInterval interval){
            // do something when beacon exited from region, ex: change background color
        }];
        
        [[CBApp getInstance] setDidChangeNearestBlock:^(CBBeacon* old, CBBeacon* current){
            // do something when nearest beacon changed
            if (current.storyline == kStorylineImage) {
                // display a brochure image
            } else if (current.storyline == kStorylineText) {
                // show text alert/notification
            } else if (current.storyline == kStorylineHtml) {
                // show html page via uiwebview
            } else if (current.storyline == kStorylineUrl) {
                // open url in a uiwebview/safari browser
            } else if (current.storyline == kStorylineVideo) {
                // play a video streaming
            }
        }];
        
        [[CBApp getInstance] setDidUpdateRange:^(double range){
            // show and update distance of a nearest beacon
        }];
        
        [[CBApp getInstance] setDidEmptyBlock:^(){
            // do something when no beacon arround detected
        }];
        
        /* This line block below is activated when using new storyline mode */
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
```

### Meta Users ###
By improving analytics usage and user engagement, Cubeacon SDK enhanced with `Meta User` module. This module is optional. So if you want to get user informations like `fullname` and `email`, show a form with 2 textinput and you can save into cloud like this :

```ios
    #import <CBKit/CBUser.h>
    
    [[CBUser currentUser] setUserDisplayName:@"User display name" andUserEmail:@"username@email.com"];
    [[CBUser currentUser] saveUserData:^(BOOL success, NSString *errorMessages) {
        if (success) {
            NSLog(@"Save meta user succeed...");
        } else {
            NSLog(@"Save meta user failed: %@", errorMessages);
        }
    }];
```

## Changelog ##
* 1.3.1 (March 19, 2015)
  - Add support `#user` on `UILocalnotification`.
  - Add method to enable debug logging from Cubeacon SDK
* 1.3.0 (February 21, 2015)
  - New storyline with custom campaign like showing Image, Video, Url web page and HTML formatted content.
  - New analytic data based new storyline
  - Comply with current Cubeacon SaaS v1.3.0
* 1.2.0 (January 28, 2015)
  - Add meta user for analytics
  - Add storyline for beacon scenario
  - Comply with current Cubeacon SaaS v1.2.0
* 1.0.0 (November 10, 2014)
  - Improve stability
  - Comply with current Cubeacon SaaS v1.0.0
  - Compatible with iOS 8
* 0.5.0 (August 25, 2014)
  - Initial release

[CubeaconSaaS]:http://developer.cubeacon.com
[AppleDoc]:http://docs.cubeacon.com/sdk/ios/references/index.html
[Issue]:https://github.com/cubeacon/ios-cubeacon-sample/issues
[KiiCloud]:http://docs.cubeacon.com/saas/signup-kii/