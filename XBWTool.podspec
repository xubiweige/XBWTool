

Pod::Spec.new do |s|
s.name         = 'XBWTool'
s.summary      = 'A collection of iOS components.'
s.version      = '0.0.1'
s.license      = 'MIT'
s.authors      = { 'xubiwei' => '93161504@qq.com' }
s.homepage     = 'https://github.com/xubiweige/XBWTool'
s.platform     = :ios, '10.0'
s.ios.deployment_target = '9.0'
s.source       = { :git => 'https://github.com/xubiweige/XBWTool.git', :tag => s.version.to_s }

s.requires_arc = true
s.source_files = 'XBWTool/*{.h,.m}'
s.ios.deployment_target = '10.0'

end


