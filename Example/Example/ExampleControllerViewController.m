//
//  ExampleControllerViewController.m
//  Example
//
//  Created by Varun Jain on 16/07/14.
//  Copyright (c) 2014 Varun Jain. All rights reserved.
//

#import "ExampleControllerViewController.h"
#import "InfiniteSlideShow.h"
#import "CustomPageControl.h"

@interface ExampleControllerViewController ()
{
    InfiniteSlideShow *slideShow;
    InfiniteSlideShow *slideShowWithCustomControl;
    CustomPageControl *pageControl;
    NSArray *dataArray;
}

@end

@implementation ExampleControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dataArray = @[@"http://images.nationalgeographic.com/wpf/media-live/photos/000/064/cache/great-white-breaching_6450_600x450.jpg",
                @"http://www.sane.org.uk/uploads/great_wall_of_china.jpg",
                @"http://www.walldesk.net/pdp/1024/13/02/Great-Voyage.jpg"];
    
    // Default Slideshow

    slideShow = [[InfiniteSlideShow alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    slideShow.dataSource = self;
    slideShow.delegate = self;
    [slideShow setUpViewWithTimerDuration:nil
                             animationDuration:nil
                             customPageControl:nil];
    [self.view addSubview:slideShow];

    
    // Slideshow with custom animation / timer and custom page control
    slideShowWithCustomControl = [[InfiniteSlideShow alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 200)];
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
    [slideShowWithCustomControl setBackgroundColor:[UIColor redColor]];
    
    [slideShowWithCustomControl setUpViewWithTimerDuration:[NSNumber numberWithFloat:5.0]
                                         animationDuration:[NSNumber numberWithFloat:0.2]
                                         customPageControl:pageControl];
    
    [self.view addSubview:slideShowWithCustomControl];
    // Setting up TimeInterval
    [NSTimer scheduledTimerWithTimeInterval:10.0
                                             target:self
                                           selector:@selector(mytimeout)
                                           userInfo:nil
                                            repeats:NO];
    
}

- (void)mytimeout {
    NSLog(@"timeout");
    dataArray = @[@"http://images.nationalgeographic.com/wpf/media-live/photos/000/064/cache/great-white-breaching_6450_600x450.jpg",
                  @"http://www.sane.org.uk/uploads/great_wall_of_china.jpg",
                  @"http://www.walldesk.net/pdp/1024/13/02/Great-Voyage.jpg",
                  @"http://phonecms.wiaapp.cn/wp-content/uploads/2014/10/vpn.jpeg"];
    [slideShow reload];
    [slideShowWithCustomControl reload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark
#pragma Infinite Slide Show Delegate methods
- (void)didClickSlideShowItem:(id)sender
{
    NSLog(@"Did click slide show item");
}

#pragma mark InfiniteSlideshow Datasource
- (NSArray *)loadSlideShowItems
{
    NSLog(@"Loading slide show items.");
    return [dataArray copy];
}



@end
