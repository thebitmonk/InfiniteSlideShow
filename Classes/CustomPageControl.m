//
//  CustomPageControl.m
//  Converse
//
//  Created by Varun Jain on 15/07/14.
//  Copyright (c) 2014 Varun Jain. All rights reserved.
//

#import "CustomPageControl.h"

#define kDotDiameter	5.0f
#define kDotSpace		6.0f

@implementation CustomPageControl

- (id)initWithFrame:(CGRect)frame
{
	if ((self = [super initWithFrame: CGRectZero]))
	{
		self.backgroundColor = [UIColor clearColor];
	}
	return self ;
}

- (id)init
{
	self = [self initWithFrame: CGRectZero];
	return self;
}

#pragma mark -
#pragma mark drawRect

- (void)drawRect:(CGRect)rect
{
	CGContextRef context = UIGraphicsGetCurrentContext();	
	CGContextSaveGState(context);
	CGContextSetAllowsAntialiasing(context, TRUE);
	
	CGFloat diameter = (_indicatorDiameter > 0) ? _indicatorDiameter : kDotDiameter;
	CGFloat space = (_indicatorSpace > 0) ? _indicatorSpace : kDotSpace;
	
	// geometry
	CGRect currentBounds = self.bounds;
	CGFloat dotsWidth = _numberOfPages * diameter + MAX(0, _numberOfPages - 1) * space;
	CGFloat x = CGRectGetMidX(currentBounds) - dotsWidth / 2;
	CGFloat y = CGRectGetMidY(currentBounds) - diameter / 2;
	
	
	// Drawing the dots
	for (int i = 0 ; i < _numberOfPages ; i++)
	{
		CGRect dotRect = CGRectMake(x, y, diameter, diameter);
		
		if (i == _currentPage)
		{
            CGContextDrawImage(context, CGRectInset(dotRect, -0.5f, -0.5f), _onImage.CGImage);
		}
		else
		{
            CGContextDrawImage(context, CGRectInset(dotRect, -0.5f, -0.5f), _offImage.CGImage);

		}
		
		x += diameter + space;
	}
	
	// restore the context
	CGContextRestoreGState(context);
}


#pragma mark -
#pragma mark Accessors

- (void)setCurrentPage:(NSInteger)pageNumber
{
	if (_currentPage == pageNumber)
		return;
	
	_currentPage = MIN(MAX(0, pageNumber), _numberOfPages - 1);
    [self setNeedsDisplay];
}

- (void)setNumberOfPages:(NSInteger)numOfPages
{
	_numberOfPages = MAX(0, numOfPages);
    _currentPage = MIN(MAX(0, _currentPage), _numberOfPages - 1);
	
	self.bounds = self.bounds;
	[self setNeedsDisplay];
	
	if (_hidesForSinglePage && (numOfPages < 2))
		[self setHidden: YES];
	else
		[self setHidden: NO];
}

- (void)setHidesForSinglePage:(BOOL)hide
{
	_hidesForSinglePage = hide;
	if (_hidesForSinglePage && (_numberOfPages < 2))
		[self setHidden: YES];
}

 - (void) setOnImage:(UIImage *)aImage
{
	_onImage = aImage;
	[self setNeedsDisplay];
}

- (void)setOffImage:(UIImage *)aImage
{

	_offImage = aImage;
	[self setNeedsDisplay];
}

- (void)setIndicatorDiameter:(CGFloat)aDiameter
{
	_indicatorDiameter = aDiameter;
	
	// correct the bounds accordingly
	self.bounds = self.bounds;
	
	[self setNeedsDisplay];
}

- (void)setIndicatorSpace:(CGFloat)aSpace
{
	_indicatorSpace = aSpace;
	self.bounds = self.bounds;
	[self setNeedsDisplay];
}

- (void)setFrame:(CGRect)aFrame
{
	aFrame.size = [self sizeForNumberOfPages: _numberOfPages];
	super.frame = aFrame;
}

- (void)setBounds:(CGRect)aBounds
{
	aBounds.size = [self sizeForNumberOfPages: _numberOfPages];
	super.bounds = aBounds;
}


#pragma mark -
#pragma mark UIPageControl methods

- (void)updateCurrentPageDisplay
{	
	[self setNeedsDisplay];
}

- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount
{
	CGFloat diameter = (_indicatorDiameter > 0) ? _indicatorDiameter : kDotDiameter;
	CGFloat space = (_indicatorSpace > 0) ? _indicatorSpace : kDotSpace;
	return CGSizeMake(pageCount * diameter + (pageCount - 1) * space + 44.0f, MAX(44.0f, diameter + 4.0f));
}

@end
