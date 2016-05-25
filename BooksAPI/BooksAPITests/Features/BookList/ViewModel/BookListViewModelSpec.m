//
//  BookListViewModelSpec.m
//  BooksAPI
//
//  Created by Alan O'Connor on 15/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ShortBookModel.h"
#import "BookListViewModel.h"

@interface BookListViewModelSpec : XCTestCase
@property (strong, nonatomic) ShortBookModel *shortBookModel;
@property (strong, nonatomic) BookListViewModel *bookListViewModel;
@end

@implementation BookListViewModelSpec

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
    self.bookListViewModel = [BookListViewModel viewModelWithModel:self.shortBookModel];
}

- (void)testThatStandardPropertiesAreCorrect {
    XCTAssertEqualObjects(self.bookListViewModel.bookId, @"12");
    XCTAssertEqualObjects(self.bookListViewModel.bookTitle, @"a title");
    XCTAssertEqualObjects(self.bookListViewModel.bookAuthor, @"me");
}

@end
