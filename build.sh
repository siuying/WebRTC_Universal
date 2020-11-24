cd webrtc/src

gn gen out/ios_64 --args='target_environment="device" target_os="ios" target_cpu="arm64" is_debug=false ios_enable_code_signing=false' 
gn gen out/ios_sim_x86 --args='target_environment="simulator" target_os="ios" target_cpu="x64" is_debug=false ios_enable_code_signing=false'
gn gen out/ios_sim_arm --args='target_environment="simulator" target_os="ios" target_cpu="arm64" is_debug=false ios_enable_code_signing=false'
gn gen out/catalyst_x86 --args='target_environment="catalyst" target_cpu="x64" ios_deployment_target="13.0" target_os="ios" treat_warnings_as_errors=false use_xcode_clang=true ios_enable_code_signing=false is_debug=false'
gn gen out/catalyst_arm --args='target_environment="catalyst" target_cpu="arm64" ios_deployment_target="13.0" target_os="ios" treat_warnings_as_errors=false use_xcode_clang=true ios_enable_code_signing=false is_debug=false'
# gn gen out/mac --args='target_os="mac" target_cpu="x64" is_debug=false'

ninja -C out/ios_64 framework_objc
ninja -C out/ios_sim_x86 framework_objc
ninja -C out/ios_sim_arm framework_objc
ninja -C out/catalyst_x86 framework_objc
ninja -C out/catalyst_arm framework_objc
# ninja -C out/mac framework_objc

xcodebuild -create-xcframework \
  -framework ./out/ios_64/WebRTC.framework \
  -framework ./out/ios_sim_x86/WebRTC.framework \
  -framework ./out/ios_sim_arm/WebRTC.framework \
  -framework ./out/catalyst_x86/WebRTC.framework \
  -framework ./out/catalyst_arm/WebRTC.framework \
  -output ./out/WebRTC.xcframework