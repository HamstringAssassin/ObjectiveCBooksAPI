//
//  ShortBookModel.h
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModel.h"

@interface ShortBookModel : NSObject <DataModel>

/**
 *  Short book ID
 */
@property(nonatomic, readonly) NSNumber *ID;

/**
 *  Book title
 */
@property(nonatomic, readonly) NSString *title;

/**
 *  Book ISBN Number
 */
@property(nonatomic, readonly) NSString *isbn;

/**
 *  Book Price
 */
@property(nonatomic, readonly) NSNumber *price;

/**
 *  price currency code
 */
@property(nonatomic, readonly) NSString *currencyCode;

/**
 *  Book author
 */
@property(nonatomic, readonly) NSString *author;

@end
