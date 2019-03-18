# WebLogBridge

[![CI Status](https://travis-ci.org/irobbin1024/WebLogBridge.svg?branch=master)](https://travis-ci.org/irobbin1024/WebLogBridge)
[![Version](https://img.shields.io/cocoapods/v/WebLogBridge.svg?style=flat)](https://cocoapods.org/pods/WebLogBridge)
[![License](https://img.shields.io/cocoapods/l/WebLogBridge.svg?style=flat)](https://cocoapods.org/pods/WebLogBridge)
[![Platform](https://img.shields.io/cocoapods/p/WebLogBridge.svg?style=flat)](https://cocoapods.org/pods/WebLogBridge)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage

1. Import Header

   ```objective-c
   #import "WLBWebLogManager.h"
   ```

2. Start Server

   ```objective-c
   [[WLBWebLogManager sharedManager] startServer];
   ```

3. Send Message

   ```objective-c
   [[WLBWebLogManager sharedManager] sendLogWithChannel:@"You Channel" content:[NSString stringWithFormat:@"Message"];
   ```

4. Open Browser，Example `http://192.168.199.196:8086/`

## Installation

WebLogBridge is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WebLogBridge'
```

## Author

irobbin1024, longbin.lai@quvideo.com

## License

WebLogBridge is available under the MIT license. See the LICENSE file for more info.
