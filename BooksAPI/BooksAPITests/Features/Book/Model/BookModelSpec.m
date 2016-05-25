//
//  BookModelSpec.m
//  BooksAPI
//
//  Created by Alan O'Connor on 15/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BookModel.h"

@interface BookModelSpec : XCTestCase
@property (nonatomic, strong) BookModel *bookModel;
@end

@implementation BookModelSpec

- (void)setUp {
    [super setUp];
    NSDictionary *data = @{
                           @"id":@12,
                           @"title":@"a title",
                           @"isbn":@"an isbn",
                           @"description":@"some kind of description",
                           @"price":@2345,
                           @"currencyCode":@"EUR",
                           @"author":@"me"
                           };
    
    self.bookModel = [[BookModel alloc] initWithData:data];
}

- (void)testThatItHasTheCorrectValues {
    XCTAssertEqualObjects(self.bookModel.ID, @12);
    XCTAssertEqualObjects(self.bookModel.title, @"a title");
    XCTAssertEqualObjects(self.bookModel.isbn, @"an isbn");
    XCTAssertEqualObjects(self.bookModel.bookDescription, @"some kind of description");
    XCTAssertEqualObjects(self.bookModel.currency, @"EUR");
    XCTAssertEqualObjects(self.bookModel.author, @"me");
    XCTAssertEqualObjects(self.bookModel.price, @2345);
}

@end
