//
//  UIColor+BooksAPI.h
//  BooksAPI
//
//  Created by O'Connor, Alan on 11/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BooksAPI)

/**
 *  Default text color
 *
 *  @return the color #624234
 */
+ (UIColor *)defaultTextColor;

/**
 *  Default background color
 *
 *  @return the color #F4F2E9
 */
+ (UIColor *)defaultBackgroundColor;

/**
 *  Bright default background color
 *
 *  @return the color #FFD454
 */
+ (UIColor *)brightDefaultBackgroundColor;

/**
 *  Bright text color
 *
 *  @return the color #FFD454
 */
+ (UIColor *)brightTextColor;

/**
 *  Primary UITableViewCell color
 *
 *  @return the color #F4F2E9
 */
+ (UIColor *)primaryCellColor;

/**
 *  Secondary UITableViewCell color
 *
 *  @return the color #CFCBB6
 */
+ (UIColor *)secondaryCellColor;

/**
 *  UITableViewCell spacer color
 *
 *  @return the color #D0CDB8
 */
+ (UIColor *)cellSpacerColor;
@end
