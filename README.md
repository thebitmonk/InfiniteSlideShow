# InfiniteSlidShow

## Installation

InfiniteSlideShow is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "InfiniteSlideShow"

## Introduction
InfiniteSlideShow comprises of two separate UI Components:

**CustomPageControl** (CustomControl): A custom UIControl (dots signifying current slide) for InfiniteSlideShow View. Various options are provided:

	+ Number of dots to be set based on datasource	
	+ Set diameter / spacing for the dots	
	+ Set custom on / off image


**InfiniteSlideShow** (UIView) :A custom UIView which lets you do infinite slideshow of images. Various options are provided: 	
	
	+ Custom time duration for triggering next slide
	+ Custom time duration for animation
	+ Fetching images over the network
	+ Custom Page Control
	+ Sliding based on user swipes
 
![Alt text](https://raw.githubusercontent.com/thebitmonk/InfiniteSlideShow/master/ScreenShots/1.png "")

![Alt text](https://raw.githubusercontent.com/thebitmonk/InfiniteSlideShow/master/ScreenShots/2.png "")

## Usage

**Basic Usage**

	self.slideShow = [[InfiniteSlideShow alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
	self.slideShow.dataSource = self;
	self.slideShow.delegate = self;
	[self.slideShow setUpView];

**Advanced Usage**
	
	slideShowWithCustomControl = [[InfiniteSlideShow alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
	slideShowWithCustomControl.dataSource = self;
	slideShowWithCustomControl.delegate = self;

	pageControl = [[CustomPageControl alloc] init];
	pageControl.hidesForSinglePage = YES;
	[pageControl setNumberOfPages:[dataArray count]] ;
	[pageControl setCurrentPage:0];
	[pageControl setOnImage:[UIImage imageNamed:@"dot_on"]];
	[pageControl setOffImage:[UIImage imageNamed:@"dot_off"]];
	[pageControl setIndicatorDiameter: 10.0f];
	[pageControl setIndicatorSpace:7.0f];

	[slideShowWithCustomControl setUpViewWithTimerDuration:[NSNumber numberWithFloat:3.0]
                             animationDuration:[NSNumber numberWithFloat:1.0]
                             customPageControl:pageControl];

Refer Example project to have a deeper look at the usage. In order to run example project you shall have to do:
	
	pod install

After this simply open Example.xcworkspace and build the project

## Authors

Varun Jain, varunjain003@gmail.com

## Thanks
* [SDWebImage](https://github.com/rs/SDWebImage)
* [CocoaPods](http://cocoapods.org)

## License

InfiniteSlideShow is available under the MIT license. See the LICENSE file for more info.
