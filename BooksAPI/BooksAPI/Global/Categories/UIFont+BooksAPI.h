//
//  UIFont+BooksAPI.h
//  BooksAPI
//
//  Created by O'Connor, Alan on 11/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (BooksAPI)

/**
 *  Arial font size
 *
 *  @param size desired font size
 *
 *  @return arial UIFont
 */
+ (UIFont *)arialFontWithSize:(CGFloat)size;

/**
 *  Arial bold font size
 *
 *  @param size desired font size
 *
 *  @return bold Arial font size
 */
+ (UIFont *)arialBoldFontWithSize:(CGFloat)size;

@end
