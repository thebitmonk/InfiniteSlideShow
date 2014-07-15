
Pod::Spec.new do |s|
  s.name         = "InfiniteSlideShow"
  s.version      = "0.0.1"
  s.summary      = "A custom UIView which lets you do infinite slideshow of images. Various options are provided: (A) custom timer for triggering next slide (B) Sliding based on user swipe gestures (C) Showing extra information corresponding to currently displayed image (D) Custom slider dots."
  s.homepage     = "http://github.com/thebitmonk/InfiniteSlideShow"
  s.license      = "MIT"
  s.author             = { "thebitmonk" => "thebitmonk@gmail.com" }
  s.social_media_url   = "http://twitter.com/thebitmonk"
  s.platform     = :ios, "6.0"
  s.source       = { :git => "http://github.com/thebitmonk/InfiniteSlideShow.git", :tag => "0.0.1" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.resources = "Resources/*.png"
  s.requires_arc = true
  s.dependency "SDWebImage", "~> 3.5.4"
end
