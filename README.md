# InfiniteSlidShow

## Installation

InfiniteSlideShow is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "InfiniteSlideShow"

## Introduction

A custom UIView which lets you do infinite slideshow of images. Various options are provided: (A) custom timer for triggering next slide (B) Sliding based on user swipe gestures (C) Showing extra information corresponding to currently displayed image (D) Custom slider dots

![Alt text](https://raw.githubusercontent.com/thebitmonk/InfiniteSlideShow/master/ScreenShots/1.png "")

![Alt text](https://raw.githubusercontent.com/thebitmonk/InfiniteSlideShow/master/ScreenShots/2.png "")

## Usage
	 self.slideShow = [[InfiniteSlideShow alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
	 self.slideShow.dataSource = self;
	 self.slideShow.delegate = self;
	 [self.slideShow setUpView];

Refer Example project to have a deeper look at the usage. In order to run example project you shall have to do:
	
	pod install

After this simply open Example.xcworkspace and build the project

## Authors

Varun Jain, varunjain003@gmail.com

## License

InfiniteSlideShow is available under the MIT license. See the LICENSE file for more info.
