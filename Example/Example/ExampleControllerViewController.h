//
//  ExampleControllerViewController.h
//  Example
//
//  Created by Varun Jain on 16/07/14.
//  Copyright (c) 2014 Varun Jain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfiniteSlideShowDatasource.h"
#import "InfiniteSlideShowDelegate.h"

@interface ExampleControllerViewController : UIViewController<
                                                            InfiniteSlideShowDatasource,
                                                            InfiniteSlideShowDelegate
                                                            >

@end
