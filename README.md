# Cubeacon SDK for iOS #
### Overview ###
Cubeacon SDK for iOS is a library to allow interaction with any iBeacons. The SDK system requirements are iOS 8 or above and Bluetooth Low Energy. 

Cubeacon SDK allows for:

  - Beacon ranging (scans beacons and optionally filters them by their properties).
  - Beacon monitoring (monitors regions for those devices that have entered/exited a region).

Learn more at:

- iOS [Apple Documentation][AppleDoc]
- Sample application [demos][Demos] of SDK usage
- Read our [Wiki][Wiki] for a basic SDK usage
- Download [Cubeacon App][AppleStore] in Apple Store to see some implementation of Cubeacon SDK

### Installation ###
1. Download `Cubeacon.framework` from [release][Github Release] page.
2. Then drag it into the `Frameworks` section in your XCode project.
3. Ensure the following frameworks and a library exist in your project :
   - `CoreLocation.framework`
   - `CoreBluetooth.framework`
4. Import Cubeacon SDK using `#import <Cubeacon/Cubeacon.h>`
5. Add the following code to initialize Cubeacon SDK in `AppDelegate` `application:didFinishLaunchingWithOptions` method :

    ```obj-c
    [Cubeacon initialize];
    ```
    **Optional:** You can add some custom setup :
    * Enable Cubeacon SDK debug logging when in development mode by calling `Cubeacon.+setLogLevel:` before initialize SDK.
    * You can choose `CBLogLevel` from : 
        - `CBLogLevelNone`
        - `CBLogLevelError`
        - `CBLogLevelWarning`
        - `CBLogLevelInfo`
        - `CBLogLevelDebug`
6. Open your project settings and go to the `Capabilities` tab. Enable these modes :
    * `Location updates`
    * `Uses Bluetooth LE accessories`
    * `Background fetch`
7. Add this two lines into `info.plist` file :

| Key                                   | Type   | Value                                                 |
|---------------------------------------|--------|-------------------------------------------------------|
| `NSLocationAlwaysUsageDescription`    | String | $(PRODUCT_NAME) use location service to scan nearby beacons |
| `NSLocationWhenInUseUsageDescription` | String | $(PRODUCT_NAME) use location service to scan nearby beacons in foreground |
| `NSBluetoothPeripheralUsageDescription` | String | $(PRODUCT_NAME) use bluetooth to scan nearby beacons |

**Optional:** You can change the value to match your needs. The values are containing the message to be displayed to the user at the prompt.

### Basic Usage ###
1. [Ranging][Ranging] for beacons
2. [Monitoring][Monitoring] beacon
3. Show [notification][Notification]

### Upload to App Store ###
Having trouble uploading to App Store? Try any of these step :
1. [Stripping Unwanted Architectures From Dynamic Libraries In Xcode][Stripping Unwanted Architectures From Dynamic Libraries In Xcode] from Daniel Kennet
2. Replacing `Cubeacon.framework` for Released only binary. [Download here][Cubeacon Release].

### Changelog ###
Read about detailed changelog [here][Changelog]

[Ranging]:https://github.com/cubeacon/ios-cubeacon-sample/wiki/Ranging-Beacons
[Monitoring]:https://github.com/cubeacon/ios-cubeacon-sample/wiki/Monitoring-Beacon
[Notification]:https://github.com/cubeacon/ios-cubeacon-sample/wiki/Show-Notification
[Changelog]:https://github.com/cubeacon/ios-cubeacon-sample/wiki/Changelog
[Demos]:https://github.com/cubeacon/ios-cubeacon-sample
[Wiki]:https://github.com/cubeacon/ios-cubeacon-sample/wiki
[Github Release]:https://github.com/cubeacon/ios-cubeacon-sample/releases
[AppleStore]:https://itunes.apple.com/id/app/cubeacon-tools/id953919362?mt=8
[AppleDoc]:http://docs.cubeacon.com/sdk/ios/references/index.html
[Stripping Unwanted Architectures From Dynamic Libraries In Xcode]:http://ikennd.ac/blog/2015/02/stripping-unwanted-architectures-from-dynamic-libraries-in-xcode/
[Cubeacon Release]:https://github.com/cubeacon/ios-cubeacon-sample/releases/download/v2.0.0/Cubeacon-Relase.framework.zip