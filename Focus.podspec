#
# Be sure to run `pod lib lint Focus.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Focus"
  s.version          = "0.1.1"
  s.summary          = "Easily focus on or highlight UI elements. Written in Swift."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Masking UIView that allows you to focus on or highlight UI elements, and is easily customizable. Great for tutorials or walkthrough where attention needs to be directed to a certain area of the screen."

  s.homepage         = "https://github.com/sudeepag/Focus"
  # s.screenshots     = "https://cloud.githubusercontent.com/assets/11940172/15418328/3c27e6a6-1e13-11e6-8480-1ab4e91b4dc1.PNG", "https://cloud.githubusercontent.com/assets/11940172/15418327/3c26995e-1e13-11e6-9373-dfa70e180623.PNG"
  s.license          = 'MIT'
  s.author           = { "Sudeep Agarwal" => "sudeep135@gmail.com" }
  s.source           = { :git => "https://github.com/sudeepag/Focus.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Focus/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Focus' => ['Focus/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
