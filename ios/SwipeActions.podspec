Pod::Spec.new do |s|
  s.name           = 'SwipeActions'
  s.version        = '1.0.0'
  s.summary        = 'Native SwiftUI swipeActions modifier for Expo UI'
  s.description    = 'Adds SwiftUI swipeActions support to Expo UI components via the modifier system.'
  s.author         = 'Manik Agnish'
  s.homepage       = 'https://www.npmjs.com/package/expo-ui-swipe-actions'
  s.platforms      = {
    :ios => '15.1'
  }
  s.source         = { :git => 'https://github.com/manikagnish/expo-ui-swipe-actions.git', :tag => "#{s.version}" }
  s.static_framework = true

  s.dependency 'ExpoModulesCore'
  s.dependency 'ExpoUI'

  # Swift/Objective-C compatibility
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
  }

  s.source_files = "**/*.{h,m,mm,swift,hpp,cpp}"
end
