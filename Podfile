# Uncomment the next line to define a global platform for your project
 platform :ios, '11.0'

target 'Key or Hay' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

	pod 'ChameleonFramework'
	pod 'TextFieldEffects'
	pod 'Spring'
	pod 'Firebase/Core'
	pod 'Firebase/Database'
	pod 'Firebase/Storage'
	pod "PromiseKit", "~> 6.0"
	pod "Hero"
	pod "Pastel"
   	pod 'ZLSwipeableViewSwift'
	pod "AMProgressBar"
	pod 'LGButton'
	pod 'UIFontComplete'


end

# Workaround for Cocoapods issue #7606
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end