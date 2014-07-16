//
//  CustomPageControl.h
//  Converse
//
//  Created by Varun Jain on 15/07/14.
//  Copyright (c) 2014 Varun Jain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPageControl : UIControl

@property (nonatomic) BOOL hidesForSinglePage;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) NSInteger numberOfPages;
@property (nonatomic, strong) UIImage *onImage;
@property (nonatomic, strong) UIImage *offImage;
@property (nonatomic) CGFloat indicatorDiameter;
@property (nonatomic) CGFloat indicatorSpace;

- (void)updateCurrentPageDisplay;
- (CGSize)sizeForNumberOfPages:(NSInteger)pages;


@end
