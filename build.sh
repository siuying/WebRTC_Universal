mkdir webrtc
cd webrtc
fetch --nohooks webrtc_ios && gclient sync

cp ../catalyst.patch src/catalyst.patch
cd src

gn gen out/ios_64 --args='target_os="ios" target_cpu="arm64" is_debug=false ios_enable_code_signing=false' 
gn gen out/ios_sim_x86 --args='target_os="ios" target_cpu="x64" is_debug=false ios_enable_code_signing=false'
gn gen out/ios_sim_arm --args='target_os="ios" target_cpu="arm64" is_debug=false ios_enable_code_signing=false'
gn gen out/mac --args='target_os="mac" target_cpu="x64" is_debug=false'
gn gen out/catalyst_x86 --args='target_environment="catalyst" target_cpu="x64" ios_deployment_target="13.0" target_os="ios" treat_warnings_as_errors=false use_xcode_clang=true'
gn gen out/catalyst_arm --args='target_environment="catalyst" target_cpu="arm64" ios_deployment_target="13.0" target_os="ios" treat_warnings_as_errors=false use_xcode_clang=true'

ninja -C out/ios_64 AppRTCMobile
ninja -C out/ios_sim_x86 AppRTCMobile
ninja -C out/ios_sim_arm AppRTCMobile
ninja -C out/mac AppRTCMobile
ninja -C out/catalyst_x86 framework_objc
ninja -C out/catalyst_arm framework_objc