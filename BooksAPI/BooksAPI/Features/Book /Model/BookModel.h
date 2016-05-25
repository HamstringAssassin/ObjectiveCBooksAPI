//
//  BookModel.h
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModel.h"

@interface BookModel : NSObject <DataModel>

/**
 *  updates Book Cover with Data
 *
 *  @param coverData NSData for book cover
 */
- (void)updateCoverData:(NSData *)coverData;

/**
 *  Book ID
 */
@property (nonatomic, readonly) NSNumber *ID;

/**
 *  Book title
 */
@property (nonatomic, readonly) NSString *title;

/**
 *  book ISBN
 */
@property (nonatomic, readonly) NSString *isbn;

/**
 *  Short description of book
 */
@property (nonatomic, readonly) NSString *bookDescription;

/**
 *  Book price
 */
@property (nonatomic, readonly) NSNumber *price;

/**
 *  Book Currency
 */
@property (nonatomic, readonly) NSString *currency;

/**
 *  Book Author
 */
@property (nonatomic, readonly) NSString *author;

/**
 *  Book Cover Data
 */
@property (nonatomic, readonly) NSData *bookCoverData;

@end
