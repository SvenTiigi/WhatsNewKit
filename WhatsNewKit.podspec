Pod::Spec.new do |s|
    s.name                      = "WhatsNewKit"
    s.version                   = "1.0.0"
    s.summary                   = "Show your new features after an app update"
    s.homepage                  = "https://github.com/SvenTiigi/WhatsNewKit"
    s.social_media_url          = 'http://twitter.com/SvenTiigi'
    s.license                   = 'MIT'
    s.author                    = { "Sven Tiigi" => "sven.tiigi@gmail.com" }
    s.source                    = { :git => "https://github.com/SvenTiigi/WhatsNewKit.git", :tag => s.version.to_s }
    s.ios.deployment_target     = "10.0"
    s.requires_arc              = true
    s.source_files              = 'Sources/**/*'
    s.frameworks                = 'Foundation', 'UIKit'
end