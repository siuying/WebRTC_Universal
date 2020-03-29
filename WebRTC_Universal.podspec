Pod::Spec.new do |s|
    s.name         = "WebRTC_Universal"
    s.version      = "1"
    s.summary      = "WebRTC SDK for iOS"
    s.description  = <<-DESC
      WebRTC is a free, open project that provides browsers and mobile
      applications with Real-Time Communications (RTC) capabilities via simple
      APIs.
                     DESC
    s.homepage     = "http://webrtc.org/"
    s.source       = { :git => "https://github.com/Anakros/WebRTC.git", :tag => s.version }
    s.license      = { :type => "Multiple", :file => "LICENSE.md" }
    s.author       = "Google Inc."
    s.preserve_paths = ["LICENSE.md"]
    s.platform     = :ios, "10.0"
    s.platform     = :mac, "10.14"
    s.vendored_frameworks = "WebRTC.xcframework"
end