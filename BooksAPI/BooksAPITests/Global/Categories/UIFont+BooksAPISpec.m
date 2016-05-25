//
//  UIFont+BooksAPISpec.m
//  BooksAPI
//
//  Created by Alan O'Connor on 15/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIFont+BooksAPI.h"

@interface UIFont_BooksAPISpec : XCTestCase
@end

@implementation UIFont_BooksAPISpec

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)testThatItReturnsCorrectFont {
    UIFont *arialFont = [UIFont fontWithName:@"arial" size:12];
    UIFont *sut = [UIFont arialFontWithSize:12];
    
    XCTAssertEqual(arialFont.fontName, sut.fontName);
    XCTAssertEqual(arialFont.pointSize, sut.pointSize);
}

- (void)testThatItReturnsCorrectBoldFont {
    UIFont *arialFont = [UIFont fontWithName:@"arial-BoldMT" size:12];
    UIFont *sut = [UIFont arialBoldFontWithSize:12];
    
    XCTAssertEqual(arialFont.fontName, sut.fontName);
    XCTAssertEqual(arialFont.pointSize, sut.pointSize);
}


@end
