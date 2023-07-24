Pod::Spec.new do |spec|

  spec.name         = "FloatingWindow"
  spec.version      = "0.0.1"
  spec.summary      = "Cicada: 框架工程（统一管理悬浮窗）"

  spec.description  = <<-DESC
			工程框架：类似新工程搭建的脚手架。
                   DESC

  spec.homepage     = "https://github.com/zhu410289616/FloatingWindow"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  #spec.license      = "MIT (example)"
  spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "zhu410289616" => "zhu410289616@163.com" }
  # Or just: spec.author    = "zhu410289616"
  # spec.authors            = { "zhu410289616" => "zhu410289616@163.com" }
  # spec.social_media_url   = "https://twitter.com/zhu410289616"


  # spec.platform     = :ios
  spec.platform     = :ios, "9.0"

  #  When using multiple platforms
  # spec.ios.deployment_target = "5.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


  spec.source       = { :git => "https://github.com/zhu410289616/FloatingWindow.git", :tag => "#{spec.version}" }
  
  
  spec.subspec "Core" do |cs|
    cs.source_files = "Pod/**/*"
  end
  
  
end
