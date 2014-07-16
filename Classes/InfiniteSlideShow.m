//
//  InfiniteSlideShow.m
//  Converse
//
//  Created by Varun Jain on 15/07/14.
//  Copyright (c) 2014 Varun Jain. All rights reserved.
//

#import "InfiniteSlideShow.h"
#import "CustomPageControl.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define ANIMATION_DURATION 0.5
#define TIMER_DURATION 3.0

@interface InfiniteSlideShow()
{
    BOOL animationInProcess;
    NSUInteger totalElements;
    NSInteger currentPage;
    NSTimer *timer;
    NSArray *dataArray;
    NSMutableArray *imageViews;
    float timerDuration;
    float animationDuration;
}

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) CustomPageControl *pageControl;

- (void)addGestureRecognizers;
- (void)setUpScrollView;
- (void)scrollingTimerWithDirectionLeft;
- (void)scrollingTimerWithDirectionRight;
- (void)addTapGestureRecognizer;
- (void)resetSlideShowTimer;
- (void)handleLeftSwipe:(UISwipeGestureRecognizer *)recognizer;
- (void)handleRightSwipe:(UISwipeGestureRecognizer *)recognizer;

@end

@implementation InfiniteSlideShow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}

-(void)setUpViewWithTimerDuration:(NSNumber *)slideTimerDuration
                animationDuration:(NSNumber *)slideAnimationDuration
                customPageControl:(CustomPageControl *)slidePageControl
{
    dataArray = [self.dataSource loadSlideShowItems];
    
    totalElements = [dataArray count];
    imageViews = [[NSMutableArray alloc] init];
    timerDuration = [slideTimerDuration floatValue] || TIMER_DURATION;
    animationDuration = [slideAnimationDuration floatValue]|| ANIMATION_DURATION;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.scrollView setDelegate:self];
    [self.scrollView setAutoresizesSubviews:UIViewAutoresizingNone];
    [self.scrollView setScrollEnabled:FALSE];
    [self.scrollView setUserInteractionEnabled:YES];
    [self setUpScrollView];
    [self addSubview:self.scrollView];
    
    currentPage = 0;

    // Setting up custom page control
    if (!slidePageControl)
    {
        self.pageControl = [[CustomPageControl alloc] init];
        self.pageControl.hidesForSinglePage = YES;
        [self.pageControl setNumberOfPages: totalElements] ;
        [self.pageControl setCurrentPage: 0];
        [self.pageControl setOnImage:[UIImage imageNamed:@"dot_on"]];
        [self.pageControl setOffImage:[UIImage imageNamed:@"dot_off"]];
        [self.pageControl setIndicatorDiameter:5.0f];
        [self.pageControl setIndicatorSpace: 6.0f];
    }
    else
    {
        self.pageControl = slidePageControl;
    }
    
    [self.pageControl setCenter: CGPointMake(self.center.x, self.frame.size.height - 20)];
    [self addSubview:self.pageControl];
    [self addGestureRecognizers];
    
    // Setting up TimeInterval
    timer = [NSTimer scheduledTimerWithTimeInterval:timerDuration
                                             target:self
                                           selector:@selector(scrollingTimerWithDirectionRight)
                                           userInfo:nil
                                            repeats:YES];
}


- (void)killTimer
{
    [timer invalidate];
    timer = nil;
}

- (void)resetSlideShowTimer
{
    [self killTimer];
    timer = [NSTimer scheduledTimerWithTimeInterval:timerDuration
                                             target:self
                                           selector:@selector(scrollingTimerWithDirectionRight)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)addGestureRecognizers
{
    // Adding left swipe
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleLeftSwipe:)];
    [leftSwipe setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self addGestureRecognizer:leftSwipe];
    leftSwipe.delegate = self;
    leftSwipe.numberOfTouchesRequired = 1;
    
    // Adding right swipe
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(handleRightSwipe:)];
    [rightSwipe setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self addGestureRecognizer:rightSwipe];
    rightSwipe.delegate = self;
    rightSwipe.numberOfTouchesRequired = 1;

}

-(void)handleLeftSwipe:(UISwipeGestureRecognizer *)recognizer
{
    [self scrollingTimerWithDirectionLeft];
    [self resetSlideShowTimer];
}


-(void)handleRightSwipe:(UISwipeGestureRecognizer *)recognizer
{
    [self scrollingTimerWithDirectionRight];
    [self resetSlideShowTimer];
}

- (void)setUpScrollView
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    imageView.userInteractionEnabled = YES;
    [imageView setTag:0];
    [imageViews addObject:imageView];
    [self.scrollView addSubview:imageView];

    for (int i=0; i<totalElements; i++)
    {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake((i + 1)*self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        [imageView setTag:i+1];
        [imageViews addObject:imageView];
        [self.scrollView addSubview:imageView];
    }

    
    // Adding the first element as last element for smoother scrolling.
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake( (totalElements + 1)*self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [imageView setTag:totalElements + 1];
    [imageViews addObject:imageView];
    [self.scrollView addSubview:imageView];
    
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width*(totalElements + 2), self.scrollView.frame.size.height)];
    [self.scrollView scrollRectToVisible:CGRectMake(self.scrollView.frame.size.width,0,self.scrollView.frame.size.width, self.scrollView.frame.size.height) animated:NO];
    
    [self addTapGestureRecognizer];
    [self setImages];
    
}

- (void)addTapGestureRecognizer
{
    for (int i=0; i< [imageViews count]; i++)
    {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
        [imageViews[i] setUserInteractionEnabled:YES];
        [imageViews[i] addGestureRecognizer:tap];
    }
}

- (void)setImages
{
    UIImageView *imageView = nil;
    NSString *imageUrl;
    for (int i=0; i< [imageViews count]; i++)
    {
        if (i == 0)
        {
            imageUrl = dataArray[totalElements -1];
        }
        else if (i == (totalElements + 1))
        {
            imageUrl = dataArray[0];
        }
        else
        {
            imageUrl = dataArray[i-1];
        }
        
        imageView = (UIImageView *)imageViews[i];
        [imageView setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
    }
}

- (void)scrollingTimerWithDirectionLeft
{
    if (animationInProcess)
    {
        return;
    }
    
    animationInProcess = TRUE;
    currentPage--;
	if (currentPage == -1)
    {
        currentPage = totalElements - 1;
		[self.scrollView scrollRectToVisible:CGRectMake((currentPage + 2) * self.scrollView.frame.size.width,0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) animated:NO];
	}
    
    self.pageControl.currentPage = currentPage;
    
    [UIView animateWithDuration:animationDuration animations:^{
        [self.scrollView setContentOffset:CGPointMake((currentPage + 1)*self.scrollView.frame.size.width, 0)];
    }
    completion:^(BOOL finished){
        animationInProcess = FALSE;
    }];
    
}

- (void)scrollingTimerWithDirectionRight
{
    if (animationInProcess)
    {
        return;
    }
    
    animationInProcess = TRUE;
    currentPage++;
        
    if (currentPage == totalElements)
    {
        currentPage = 0;
		[self.scrollView scrollRectToVisible:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height) animated:NO];
	}

    self.pageControl.currentPage = currentPage;
    
    [UIView animateWithDuration:animationDuration animations:^{
        [self.scrollView setContentOffset:CGPointMake((currentPage + 1)*self.scrollView.frame.size.width, 0)];
    }
    completion:^(BOOL finished){
        animationInProcess = FALSE;
    }];
    
}

- (void)tapDetected:(UITapGestureRecognizer *)sender
{
    NSLog(@"Hey you just tapped an image");
    UIImageView *imageView = (UIImageView *)sender.view;
    NSInteger tag = imageView.tag;
    if (tag == 0)
    {
        tag = totalElements;
    }
    if (tag == totalElements + 1)
    {
        tag = 1;
    }
    [self.delegate didClickSlideShowItem:dataArray[tag -1]];
}


@end
