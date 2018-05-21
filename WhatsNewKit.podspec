Pod::Spec.new do |s|
  s.name         = "WhatsNewKit"
  s.version      = "0.1"
  s.summary      = ""
  s.description  = <<-DESC
    Your description here.
  DESC
  s.homepage     = ""
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Sven Tiigi" => "sven.tiigi@gmail.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "10.0"
  s.source       = { :git => ".git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
