//
//  BooksFetcher.h
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
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



@interface BooksFetcher : NSObject

/**
 *  gets a list of all books
 *
 *  @param booksFetcherBlock a return block
 */
- (void)getBooks:(booksFetcherBlock)booksFetcherBlock;

/**
 *  gets information on a specific book
 *
 *  @param bookId            a book id
 *  @param booksFetcherBlock a return block
 */
- (void)bookModelWithId:(NSString *)bookId handler:(booksFetcherBlock)booksFetcherBlock;

@end
