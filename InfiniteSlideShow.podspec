
Pod::Spec.new do |s|
  s.name         = "InfiniteSlideShow"
  s.version      = "0.0.1"
  s.summary      = "A custom UIView which lets you do infinite slideshow of images. Various options are provided:

          + Custom time duration for triggering next slide
          + Custom time duration for animation
          + Fetching images over the network
          + Custom Page Control
          + Sliding based on user swipes
  "
  s.homepage     = "http://github.com/thebitmonk/InfiniteSlideShow"
  s.license      = "MIT"
  s.author             = { "Varun Jain" => "varunjain003@gmail.com" }
  s.social_media_url   = "http://twitter.com/thebitmonk"
  s.platform     = :ios, "6.0"
  s.source       = { :git => "http://github.com/thebitmonk/InfiniteSlideShow.git", :tag => "0.0.1" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.resources = "Resources/*.png"
  s.requires_arc = true
  s.dependency "SDWebImage", "~> 3.5.4"
end
