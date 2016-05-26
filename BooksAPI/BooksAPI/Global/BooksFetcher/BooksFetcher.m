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

@end
