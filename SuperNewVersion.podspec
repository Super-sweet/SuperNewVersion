

Pod::Spec.new do |s|


  s.name         = "SuperNewVersion"
  s.version      = "1.1.2"
  s.summary      = "版本更新提示"
   s.description  = <<-DESC
	一行代码实现版本提示更新
                   DESC
  s.homepage     = "https://github.com/Super-sweet/SuperNewVersion"
  s.license      =  "MIT"

  s.author             = { "Super-sweet" => "347393193@qq.com" }
 
  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/Super-sweet/SuperNewVersion.git", :tag => s.version }
  s.source_files  = "SuperNewVersion/SuperNewVersion/*.{h,m}"
  s.frameworks    = "UIKit","Foundation"
  s.requires_arc = true
end
