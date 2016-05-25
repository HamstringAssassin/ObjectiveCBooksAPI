//
//  BookListViewModel.h
//  BooksAPI
//
//  Created by O'Connor, Alan on 10/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ShortBookModel.h"
#import "ViewModel.h"


@interface BookListViewModel : NSObject <ViewModel>

/**
 *  Table View Cell Height
 *
 *  @return a CGFloat for table View cell Height
 */
- (CGFloat)cellHeight;

/**
 *  Cell Identifier
 *
 *  @return an NSString
 */
- (NSString *)cellIdentifier;

/**
 *  Book ID
 */
@property (nonatomic, strong, readonly) NSString *bookId;

/**
 *  Book Title
 */
@property (nonatomic, strong, readonly) NSString *bookTitle;

/**
 *  Book Author
 */
@property (nonatomic, strong, readonly) NSString *bookAuthor;

/**
 *  Background color for the tableViewCell
 */
@property (nonatomic, strong, readwrite) UIColor *backgroundColor;

@end
