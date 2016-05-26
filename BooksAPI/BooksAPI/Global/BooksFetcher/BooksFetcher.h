//
//  BooksFetcher.h
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataFetcher.h"

@interface BooksFetcher : NSObject <DataFetcher>

/**
 *  gets a list of all books
 *
 *  @param booksFetcherBlock a return block
 */
- (void)getBooks:(booksFetcherBlock)booksFetcherBlock;

@end
