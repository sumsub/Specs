Pod::Spec.new do |s|

    s.name              = 'IdensicMobileSDK'
    s.version           = '1.46.1'
    s.summary           = 'Sumsub Mobile SDK'
    s.authors           = 'Sumsub'
    s.homepage          = 'https://sumsub.com/'
    s.license           = { :type => 'Proprietary', :text => 'Copyright © Sumsub. All rights reserved.' }
    s.documentation_url = 'https://docs.sumsub.com/docs/get-started-ios'
    s.platform          = :ios
    s.source            = { :http => "https://maven.sumsub.com/repository/releases/IdensicMobileSDK-iOS/#{s.version}/IdensicMobileSDK-#{s.version}.zip" }
    s.swift_versions    = ['5']

    s.ios.deployment_target = '13.0'
    s.default_subspec = 'Default'

    s.subspec 'Default' do |s|
        s.dependency 'IdensicMobileSDK/Core'
    end

    s.subspec 'Core' do |s|
        s.ios.vendored_frameworks = 'IdensicMobileSDK.xcframework'
    end

    s.subspec 'MRTDReader' do |s|
        s.dependency 'IdensicMobileSDK/MRTDReader-latest'
    end

    s.subspec 'MRTDReader-core' do |s|
        s.ios.vendored_frameworks = 'IdensicMobileSDK_MRTDReader.xcframework'
        s.dependency 'IdensicMobileSDK/Core'
    end

    s.subspec 'MRTDReader-kinegram' do |s|
        s.dependency 'IdensicMobileSDK/MRTDReader-core'
        s.dependency 'KinegramEmrtdConnector', '>= 2.16.0', '< 3.0.0'
    end

    s.subspec 'MRTDReader-compat' do |s|
        s.dependency 'IdensicMobileSDK/MRTDReader-kinegram'
        s.dependency 'OpenSSL-Universal', '< 3.1.5001'
    end

    s.subspec 'MRTDReader-latest' do |s|
        s.dependency 'IdensicMobileSDK/MRTDReader-kinegram'
        s.dependency 'OpenSSL-Universal', '>= 3.1.5001'
    end

    s.subspec 'VideoIdent' do |s|
        s.dependency 'IdensicMobileSDK/VideoIdent-latest'
    end

    s.subspec 'VideoIdent-compat' do |s|
        s.ios.vendored_frameworks = 'IdensicMobileSDK_VideoIdent.xcframework'
        s.dependency 'IdensicMobileSDK/Core'
        s.dependency 'TwilioVideo', '< 5.8.2'
    end

    s.subspec 'VideoIdent-latest' do |s|
        s.ios.vendored_frameworks = 'IdensicMobileSDK_VideoIdent.xcframework'
        s.dependency 'IdensicMobileSDK/Core'
        s.dependency 'TwilioVideo', '>= 5.8.2'
    end

    s.subspec 'EID' do |s|
        s.ios.vendored_frameworks = 'IdensicMobileSDK_EID.xcframework'
        s.dependency 'IdensicMobileSDK/Core'
        s.dependency 'AuthadaAuthenticationLibrary', '1.4.1'
    end
    
    s.subspec 'Fisherman' do |s|
        s.ios.vendored_frameworks = 'IdensicMobileSDK_Fisherman.xcframework'
        s.dependency 'IdensicMobileSDK/Core'
        s.dependency 'FingerprintPro', '>= 2.17.1', '< 3.0'
    end
end
