//
//  ExampleControllerViewController.m
//  Example
//
//  Created by Varun Jain on 16/07/14.
//  Copyright (c) 2014 Varun Jain. All rights reserved.
//

#import "ExampleControllerViewController.h"
#import "InfiniteSlideShow.h"

@interface ExampleControllerViewController ()
@property (strong, nonatomic) InfiniteSlideShow *slideShow;
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
    [self.view setBackgroundColor:[UIColor redColor]];
    self.slideShow = [[InfiniteSlideShow alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    self.slideShow.dataSource = self;
    self.slideShow.delegate = self;
    [self.slideShow setUpView];
    [self.view addSubview:self.slideShow];
    
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
    NSArray *dataArray = @[@"http://images.nationalgeographic.com/wpf/media-live/photos/000/064/cache/great-white-breaching_6450_600x450.jpg",
                                  @"http://www.sane.org.uk/uploads/great_wall_of_china.jpg",
                                  @"http://www.walldesk.net/pdp/1024/13/02/Great-Voyage.jpg"];
    return dataArray;
}



@end
