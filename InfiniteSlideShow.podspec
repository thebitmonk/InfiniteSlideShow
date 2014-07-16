
Pod::Spec.new do |s|
  s.name         = "InfiniteSlideShow"
  s.version      = "0.1"
  s.summary      = "Provides customizable infinite slideshow UIView which displays images fetched over the network."
  s.homepage     = "http://github.com/thebitmonk/InfiniteSlideShow"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "Varun Jain" => "varunjain003@gmail.com" }
  s.social_media_url   = "http://twitter.com/thebitmonk"
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/thebitmonk/InfiniteSlideShow.git", :tag => "0.1" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.resources = "Resources/*.png"
  s.requires_arc = true
  s.dependency "SDWebImage", "~> 3.5.4"
end
