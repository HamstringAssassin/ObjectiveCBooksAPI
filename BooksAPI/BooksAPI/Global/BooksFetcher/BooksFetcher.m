//
//  BooksFetcher.m
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BooksFetcher.h"
#import "BookServerURLReader.h"
#import "ShortBookModel.h"
#import "BookModel.h"
#import "AFNetworking.h"

@interface BooksFetcher ()
@end

@implementation BooksFetcher

- (void)getBooks:(booksFetcherBlock)booksFetcherBlock {
    [self allBooksDataWithHandler:^(id data) {
        NSArray *bookList = [self booksModelsFromData:data];
        booksFetcherBlock(bookList.copy);
    }];
}

- (void)allBooksDataWithHandler:(BookDataBlock)bookDataBlock {
    NSURL *bookListURL = [[BookServerURLReader bookServerURLReaderSingleton] bookListURL];
    __block NSArray *results;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:bookListURL.absoluteString
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        results = (NSArray *)responseObject;
        bookDataBlock(results);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (NSArray *)booksModelsFromData:(NSArray *)data {
    NSMutableArray *shortBookModels = [NSMutableArray new];
    for (NSDictionary *shortBook in data) {
        ShortBookModel *shortBookModel = [[ShortBookModel alloc] initWithData:shortBook];
        [shortBookModels addObject:shortBookModel];
    }
    return shortBookModels.copy;
}

- (void)bookModelWithId:(NSString *)bookId handler:(booksFetcherBlock)booksFetcherBlock {
    [self bookDataWithId:bookId andHandler:^(id data) {
        NSArray *bookModel = [self bookModelFromData:data];
        booksFetcherBlock(bookModel.copy);
    }];
}

- (NSArray *)bookModelFromData:(NSArray *)data {
    NSMutableArray *bookArray = [NSMutableArray new];
    for (NSDictionary *bookData in data) {
        BookModel *bookModel = [[BookModel alloc] initWithData:bookData];
        [self updateBookModelWithCover:bookModel];
        [bookArray addObject:bookModel];
    }
    return bookArray.copy;
}

- (void)updateBookModelWithCover:(BookModel *)bookModel {
    if (bookModel.isbn) {
        [bookModel updateCoverData:[self bookCoverWithISBN:bookModel.isbn]];
    }
}

- (NSData *)bookCoverWithISBN:(NSString *)isbn {
    NSURL *bookCoverURL = [[BookServerURLReader bookServerURLReaderSingleton] bookCoverURLWithISBN:isbn];
    NSData *imageData = [NSData dataWithContentsOfURL:bookCoverURL];
    return imageData;
}

- (void)bookDataWithId:(NSString *)bookId andHandler:(BookDataBlock)bookDataBlock {
    NSURL *singleBookURL = [[BookServerURLReader bookServerURLReaderSingleton] urlForBookId:bookId];
    __block NSDictionary *results;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:singleBookURL.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        results = (NSDictionary *)responseObject;
        bookDataBlock(@[results]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        bookDataBlock(@[[self handleErrorMessage]]);
    }];
}

- (NSDictionary *) handleErrorMessage {
    return @{@"description":@"uh-oh... Something went wrong. Unknown Book."};
}

@end
