//
//  DataFetcher.h
//  BooksAPI
//
//  Created by Alan O'Connor on 26/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Books Fetcher Block
 *
 *  @param books an array of books
 */
typedef void (^booksFetcherBlock)(NSArray *books);

typedef void (^BookDataBlock)(id data);

@protocol DataFetcher <NSObject>

@end
