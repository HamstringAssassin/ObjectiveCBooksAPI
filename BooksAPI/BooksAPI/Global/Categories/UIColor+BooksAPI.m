//
//  UIColor+BooksAPI.m
//  BooksAPI
//
//  Created by O'Connor, Alan on 11/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "UIColor+BooksAPI.h"

@implementation UIColor (BooksAPI)

+ (UIColor *)colorWithHex:(NSString *)hexString alpha:(CGFloat) alpha {
	NSString *red = @"";
	NSString *green = @"";
	NSString *blue = @"";
	
	int hexStart = 1;
	
	NSString *first = [hexString substringWithRange:NSMakeRange(0, 1)];
	
	if(![first isEqualToString:@"#"]) {
		hexStart = 0;
	}
	
	red = [hexString substringWithRange:NSMakeRange(hexStart, 2)];
	green = [hexString substringWithRange:NSMakeRange(hexStart+2, 2)];
	blue = [hexString substringWithRange:NSMakeRange(hexStart+4, 2)];
	
	unsigned int resultRed = 0;
	unsigned int resultGreen = 0;
	unsigned int resultBlue = 0;
	
	// http://stackoverflow.com/questions/3648411/objective-c-parse-hex-string-to-integer
	
	[[NSScanner scannerWithString:red] scanHexInt:&resultRed];
	[[NSScanner scannerWithString:green] scanHexInt:&resultGreen];
	[[NSScanner scannerWithString:blue] scanHexInt:&resultBlue];
	

	return [UIColor colorWithRed: (float)resultRed/255.0f
						   green:(float)resultGreen/255.0f
							blue:(float)resultBlue/255.0f
						   alpha:alpha];
}

+ (UIColor *)defaultTextColor {
	return [self colorWithHex:@"#624234" alpha:1];
}

+ (UIColor *)brightTextColor {
	return [self colorWithHex:@"#FFD454" alpha:1];
}

+ (UIColor *)defaultBackgroundColor {
	return [self colorWithHex:@"#F4F2E9" alpha:1];
}

+ (UIColor *)brightDefaultBackgroundColor {
	return [self colorWithHex:@"#FFD454" alpha:1];
}

+ (UIColor *)primaryCellColor {
    return [self colorWithHex:@"#F4F2E9" alpha:1];
}

+ (UIColor *)secondaryCellColor {
    return [self colorWithHex:@"#CFCBB6" alpha:1];
}

+ (UIColor *)cellSpacerColor {
    return [self colorWithHex:@"#D0CDB8" alpha:1];
}

@end
