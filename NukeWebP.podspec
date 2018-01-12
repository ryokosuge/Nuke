Pod::Spec.new do |s|
    s.name             = 'NukeWebP'
    s.version          = '6.0'
    s.summary          = 'A powerful image loading and caching framework'
    s.description  = <<-EOS
    A powerful image loading and caching framework which allows for hassle-free image loading in your app - often in one line of code.
    EOS

    s.homepage         = 'https://github.com/ryokosuge/Nuke-WebP'
    s.license          = 'MIT'
    s.author           = 'ryokosuge'
    s.social_media_url = 'https://twitter.com/ryo_kosuge'
    s.source           = { :git => 'https://github.com/ryokosuge/Nuke-WebP.git', :tag => s.version.to_s }

    s.requires_arc		= true

    s.ios.deployment_target = '9.0'
    # s.watchos.deployment_target = '2.0'
    # s.osx.deployment_target = '10.11'
    # s.tvos.deployment_target = '9.0'

    s.source_files  = 'Sources/**/*.swift', 'Sources/WebP/*.{h,m}'

    s.xcconfig = {
      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
    }
    s.dependency 'libwebp'
end
