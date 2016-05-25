//
//  UIFont+BooksAPI.m
//  BooksAPI
//
//  Created by O'Connor, Alan on 11/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "UIFont+BooksAPI.h"

@implementation UIFont (BooksAPI)

+ (UIFont *)arialFontWithSize:(CGFloat)size {
	return [UIFont fontWithName:@"arial" size:size];
}

+ (UIFont *)arialBoldFontWithSize:(CGFloat)size {
	return [UIFont fontWithName:@"arial-BoldMT" size:size];
}

@end
