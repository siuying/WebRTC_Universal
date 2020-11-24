mkdir webrtc
cd webrtc
fetch --nohooks webrtc_ios && gclient sync
cp ../catalyst.patch src/catalyst.patch
cp ../codesign.py src/build/config/ios/codesign.py
