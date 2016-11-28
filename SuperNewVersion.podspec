

Pod::Spec.new do |s|


  s.name         = "SuperNewVersion"
  s.version      = "0.0.6"
  s.summary      = "版本更新提示"
  s.homepage     = "https://github.com/Super-sweet/SuperNewVersion"
  s.license      =  "MIT"

  s.author             = { "Super-sweet" => "347393193@qq.com" }
 
  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/Super-sweet/SuperNewVersion.git", :tag => s.version }
  s.source_files  = "SuperNewVersion", "*.{h,m}"
  s.requires_arc = true
end
