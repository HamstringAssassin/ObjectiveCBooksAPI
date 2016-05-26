//
//  BookFetcher.h
//  BooksAPI
//
//  Created by Alan O'Connor on 26/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataFetcher.h"

@interface BookFetcher : NSObject <DataFetcher>

///**
// *  gets information on a specific book
// *
// *  @param bookId            a book id
// *  @param booksFetcherBlock a return block
// */
//- (void)bookModelWithId:(NSString *)bookId handler:(booksFetcherBlock)booksFetcherBlock;

- (void)bookDataWithId:(NSString *)bookId andHandler:(BookDataBlock)bookDataBlock;


@end
