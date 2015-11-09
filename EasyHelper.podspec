Pod::Spec.new do |s|
s.name					= "EasyHelper"
s.version				= "1.0.0"
s.summary				= "EasyHelper is a simple library for quick prototyping and rapid development in iOS."
s.homepage				= "https://github.com/DaRkD0G/EasyHelper"
s.license				= { :type => "MIT", :file => 'LICENSE' }
s.authors				= { "DaRkD0G" => "stephan.yannick@me.com" }

s.ios.deployment_target	= "8.0"
s.source				= { :git => "https://github.com/DaRkD0G/EasyHelper.git", :tag => "#{s.version}"}
s.source_files			= "EasyHelper/**/*.{swift}"
s.requires_arc			= true
end