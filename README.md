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
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Cubeacon" ofType:@"plist"];
        [CBApp setupWithPlist:plistPath];
        [[CBApp getInstance] refreshBeacons];
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
            // do something when beacon entered, ex: change background color
            [self.view setBackgroundColor:beacon.color];
        }];
        [[CBApp getInstance] setDidExitBlock:^(CBBeacon* beacon, NSTimeInterval interval){
            // do something when beacon exited, ex: change background color
            [self.view setBackgroundColor:[UIColor whiteColor]];
        }];
        [[CBApp getInstance] setDidChangeNearestBlock:^(CBBeacon* old, CBBeacon* current){
            // do something when nearest beacon changed, ex: change background color
            [self.view setBackgroundColor:current.color];
        }];
    }
```

## Changelog ##
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