//
//  BookFetcher.m
//  BooksAPI
//
//  Created by Alan O'Connor on 26/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BookFetcher.h"
#import "AFNetworking.h"
#import "BookServerURLReader.h"
#import "BookModel.h"

@implementation BookFetcher

- (void)bookDataWithId:(NSString *)bookId andHandler:(BookDataBlock)bookDataBlock {
    NSURL *singleBookURL = [[BookServerURLReader bookServerURLReaderSingleton] urlForBookId:bookId];
    __block NSDictionary *results;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:singleBookURL.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        results = (NSDictionary *)responseObject;
        bookDataBlock(@[results]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //Need to Handle this....eek
    }];
}


@end
