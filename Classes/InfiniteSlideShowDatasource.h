//
//  InfiniteSlideShowDatasource.h
//  Converse
//
//  Created by Varun Jain on 15/07/14.
//  Copyright (c) 2014 Varun Jain. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol InfiniteSlideShowDatasource <NSObject>
- (NSArray *)loadSlideShowItems;
@end
