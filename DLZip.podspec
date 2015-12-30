#
# Be sure to run `pod lib lint DLZip.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "DLZip"
s.version          = "0.4.0"
s.summary          = "DLZip. zip, unzip."
s.description      = "DLZip is easier for unzip .zipfile or zip files."
s.homepage         = "https://github.com/WildDylan/DLZip"
s.license          = 'MIT'
s.author           = { "Dylan" => "3664132@163.com" }
s.source           = { :git => "https://github.com/WildDylan/DLZip.git", :tag => s.version.to_s }
s.platform     = :ios, '7.0'
s.ios.deployment_target = '4.0'
s.library = 'z'
s.requires_arc = true
s.source_files = 'Pod/Classes/**/*'
end
