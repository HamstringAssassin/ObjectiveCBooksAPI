//
//  BookViewModel.h
//  BooksAPI
//
//  Created by Alan O'Connor on 10/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BookViewModel.h"
#import "ViewModel.h"

@interface BookViewModel : NSObject <ViewModel>

/**
 *  Book ID
 */
@property (nonatomic, readonly) NSNumber *bookId;

/**
 *  Book title
 */
@property (nonatomic, readonly) NSString *bookTitle;

/**
 *  book ISBN
 */
@property (nonatomic, readonly) NSString *bookIsbn;

/**
 *  Short description of book
 */
@property (nonatomic, readonly) NSString *bookFullDescription;

/**
 *  Book price
 */
@property (nonatomic, readonly) NSString *bookPrice;

/**
 *  Book Currency
 */
@property (nonatomic, readonly) NSString *bookCurrency;

/**
 *  Book Author
 */
@property (nonatomic, readonly) NSString *BookAuthor;

/**
 *  Book cover
 */
@property (nonatomic, readonly) UIImage *bookCover;


@end
