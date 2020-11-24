mkdir webrtc
cd webrtc
fetch --nohooks webrtc_ios && gclient sync
cp ../catalyst.patch src/catalyst.patch
