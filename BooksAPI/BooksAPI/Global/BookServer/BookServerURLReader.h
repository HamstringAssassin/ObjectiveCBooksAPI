//
//  BookServerURLReader.h
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookServerURLReader : NSObject

+ (id)bookServerURLReaderSingleton;


//+ (instancetype)bookServerURLReader;

/**
 *  Returns the URL for All books
 *
 *  @return a URL
 */
- (NSURL *)bookListURL;

/**
 *  Returns the URL for a given Books ID
 *
 *  @param bookId a book ID
 *
 *  @return a URL for a specific Book
 */
- (NSURL *)urlForBookId:(NSString *)bookId;

/**
 *  Returns a URL for a given Book ISBN
 *
 *  @param isbn the book ISBN number
 *
 *  @return a URL for a book cover
 */
- (NSURL *)bookCoverURLWithISBN:(NSString *)isbn;

@end
