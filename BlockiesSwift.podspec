#
# Be sure to run `pod lib lint BlockiesSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BlockiesSwift'
  s.version          = '0.1.0'
  s.summary          = 'Generate unique Blockies images for wallets'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Blockies is a library which generates unique images for a given seed string.
This can be used to create images to represent Bitcoin, Ethereum and other Cryptocurrency wallets.
This is an exact implementation as the one the Mist Wallet uses.
                       DESC

  s.homepage         = 'https://github.com/Boilertalk/BlockiesSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Koray Koska' => 'koray@koska.at' }
  s.source           = { :git => 'https://github.com/Boilertalk/BlockiesSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'BlockiesSwift/Classes/**/*'

  # s.resource_bundles = {
  #   'BlockiesSwift' => ['BlockiesSwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  # s.test_spec 'Tests' do |test_spec|
  #   test_spec.source_files = 'Example/Tests/*.{h,m,swift}'
  #   # test_spec.dependency 'OCMock' # This dependency will only be linked with your tests.
  # end
end
