//
//  BookViewModelSpec.m
//  BooksAPI
//
//  Created by Alan O'Connor on 15/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BookModel.h"
#import "BookViewModel.h"

@interface BookViewModelSpec : XCTestCase
@property (strong, nonatomic) BookModel *bookModel;
@property (strong, nonatomic) BookViewModel *bookViewModel;
@end

@implementation BookViewModelSpec

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
    self.bookViewModel = [BookViewModel viewModelWithModel:self.bookModel];
}

- (void)testThatStandardPropertiesAreCorrect {
    XCTAssertEqualObjects(self.bookViewModel.bookId, @12);
    XCTAssertEqualObjects(self.bookViewModel.bookTitle, @"a title");
    XCTAssertEqualObjects(self.bookViewModel.bookIsbn, @"an isbn");
    XCTAssertEqualObjects(self.bookViewModel.bookFullDescription, @"some kind of description");
    XCTAssertEqualObjects(self.bookViewModel.BookAuthor, @"me");    
}

- (void)testThatPriceAndCurrencyAreCorrect {
    XCTAssertEqualObjects(self.bookViewModel.bookPrice, @"€23.45");
}
@end
