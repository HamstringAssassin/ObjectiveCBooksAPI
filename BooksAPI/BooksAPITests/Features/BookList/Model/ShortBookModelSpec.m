//
//  ShortBookModelSpec.m
//  BooksAPI
//
//  Created by Alan O'Connor on 15/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ShortBookModel.h"

@interface ShortBookModelSpec : XCTestCase
@property (nonatomic, strong) ShortBookModel *shortBookModel;
@end

@implementation ShortBookModelSpec

- (void)setUp {
    [super setUp];
    
    NSDictionary *data = @{
                           @"id":@12,
                           @"title":@"a title",
                           @"isbn":@"an isbn",
                           @"price":@2345,
                           @"currencyCode":@"EUR",
                           @"author":@"me"
                           };
    
    self.shortBookModel = [[ShortBookModel alloc] initWithData:data];
}

- (void)testThatItHasTheCorrectValues {
    XCTAssertEqualObjects(self.shortBookModel.ID, @12);
    XCTAssertEqualObjects(self.shortBookModel.title, @"a title");
    XCTAssertEqualObjects(self.shortBookModel.isbn, @"an isbn");
    XCTAssertEqualObjects(self.shortBookModel.currencyCode, @"EUR");
    XCTAssertEqualObjects(self.shortBookModel.author, @"me");
    XCTAssertEqualObjects(self.shortBookModel.price, @2345);
}

@end
