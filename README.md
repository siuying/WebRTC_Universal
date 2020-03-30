# WebRTC Universial Binary

This is WebRTC framework in xcframework format for iOS and macOS.

Google provides the official builds for iOS, if all you need is iOS build, get it from Google:

- https://cocoapods.org/pods/GoogleWebRTC
- https://webrtc.github.io/webrtc-org/native-code/io/

## Installation

### Manual Install

Download the xcframework at [Release](https://github.com/siuying/WebRTC_Universal/releases) and drag it into your Xcode project.

### CocoaPods

Requires cocoapods 1.9.0 or above.

``
pod "WebRTC", :git => "https://github.com/siuying/WebRTC_Universal"
``

## Building your own manually

1. Setup WebRTC Native Code project at (http://webrtc.github.io/webrtc-org/native-code/), you will need prerequisite tools (Chromium depot tools, ninja and Xcode)
2. Generate iOS and macOS targets
```
gn gen out/ios_64 --args='target_os="ios" target_cpu="arm64" is_debug=false' 
gn gen out/ios_sim --args='target_os="ios" target_cpu="x64" is_debug=false'
gn gen out/mac --args='target_os="mac" target_cpu="x64" is_debug=false'                                               
```
3. Build the targets
```
ninja -C out/ios_64 AppRTCMobile
ninja -C out/ios_sim AppRTCMobile
ninja -C out/mac AppRTCMobile
```
4. Generate xcframework
```
xcodebuild -create-xcframework \
  -framework ./out/ios_64/WebRTC.framework \
  -framework ./out/ios_sim/WebRTC.framework \
  -framework ./out/mac/WebRTC.framework \
  -output ./out/WebRTC.xcframework
```