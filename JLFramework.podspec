Pod::Spec.new do |s|
  s.name             = 'JLFramework'
  s.version          = '0.1.2'
  s.summary          = 'JLFramwork is a set of coding tools and coding style.'

  s.homepage         = 'https://github.com/JasonRSTX/JLFramework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'JasonRSTX' => 'rstx_reg@aliyun.com' }
  s.source           = { :git => 'https://github.com/JasonRSTX/JLFramework.git', :tag => s.version.to_s }
  s.requires_arc     = true

  s.ios.deployment_target = '8.0'

  s.source_files = 'JLFramework/Classes/JLFramework.h'
  s.public_header_files = 'JLFramework/Classes/JLFramework.h'

  s.subspec 'Category' do |ss|
    ss.subspec 'Hook' do |sss|
      sss.source_files = 'JLFramework/Classes/Category/Hook/*.*'
      sss.public_header_files = 'JLFramework/Classes/Category/Hook/*.h'
      sss.dependency 'JRSwizzle', '~> 1.0.0'

    end

    ss.subspec 'SafeAccess' do |sss|
      sss.source_files = 'JLFramework/Classes/Category/SafeAccess/*.*'
      sss.public_header_files = 'JLFramework/Classes/Category/SafeAccess/*.h'
    end

    ss.subspec 'Tools' do |sss|
      sss.source_files = 'JLFramework/Classes/Category/Tools/*.*'
      sss.public_header_files = 'JLFramework/Classes/Category/Tools/*.h'
      sss.dependency 'JRSwizzle', '~> 1.0.0'
    end
  end

  s.subspec 'CoreData' do |ss|
    ss.source_files = 'JLFramework/Classes/CoreData/*.*'
    ss.public_header_files = 'JLFramework/Classes/CoreData/*.h'
    ss.dependency 'JRSwizzle', '~> 1.0.0'
  end

  s.subspec 'JSONKit' do |ss|
    ss.source_files = 'JLFramework/Classes/JSONKit/*.*'
    ss.public_header_files = 'JLFramework/Classes/JSONKit/*.h'
  end

end
