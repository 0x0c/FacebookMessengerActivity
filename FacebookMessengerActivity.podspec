#
# Be sure to run `pod lib lint FacebookMessengerActivity.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "FacebookMessengerActivity"
  s.version          = "0.1.0"
  s.summary          = "Share with Facebook Messenger App."
  s.description      = <<-DESC
Facebook SDK for iOS is required.

https://developers.facebook.com/docs/ios/getting-started/
                       DESC
  s.homepage         = "https://github.com/0x0c/FacebookMessengerActivity"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Akira Matsuda" => "akira.matsuda@me.com" }
  s.source           = { :git => "https://github.com/0x0c/FacebookMessengerActivity.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'FacebookMessengerActivity' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
