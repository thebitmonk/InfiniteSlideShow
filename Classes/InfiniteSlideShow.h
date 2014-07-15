//
//  InfiniteSlideShow.h
//  Converse
//
//  Created by Varun Jain on 15/07/14.
//  Copyright (c) 2014 Varun Jain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfiniteSlideShowDatasource.h"
#import "InfiniteSlideShowDelegate.h"

@interface InfiniteSlideShow : UIView<
                                    UIScrollViewDelegate,
                                    UIGestureRecognizerDelegate
                                    >

@property (nonatomic, weak) id<InfiniteSlideShowDatasource> dataSource;
@property (nonatomic, weak) id<InfiniteSlideShowDelegate> delegate;

-(void)setUpView;
-(void)killTimer;

@end
