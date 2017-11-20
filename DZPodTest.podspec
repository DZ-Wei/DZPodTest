

Pod::Spec.new do |s|
  s.name             = 'DZPodTest'
  s.version          = '0.1.0'
  s.summary          = 'test pod'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/DZ-Wei/DZPodTest.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DZ-Wei' => '410477564@qq.com' }
  s.source           = { :git => 'https://github.com/DZ-Wei/DZPodTest.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DZPodTest/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DZPodTest' => ['DZPodTest/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
