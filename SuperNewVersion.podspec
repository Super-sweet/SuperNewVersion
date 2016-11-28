

Pod::Spec.new do |s|


  s.name         = "SuperNewVersion"
  s.version      = "0.0.1"
  s.summary      = "版本更新弹框"
  s.homepage     = "https://github.com/Super-sweet/SuperNewVersion"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Super-sweet" => "347393193@qq.com" }
 
  # s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/Super-sweet/SuperNewVersion.git", :tag => "{s.version}" }
  s.source_files  = "demo1", "*.{h,m}"
  s.requires_arc = true
end
