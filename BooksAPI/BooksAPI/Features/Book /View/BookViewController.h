//
//  BookViewController.h
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookViewModel.h"

@interface BookViewController : UIViewController

/**
 *  Sets the viewControllers viewModel
 *
 *  @param viewModel a ViewModel
 */
- (void)setViewModel:(BookViewModel *)viewModel;

/**
 *  Updates with a new Book ID
 *
 *  @param bookId a Book ID
 */
- (void)updateWithBookID:(NSString *)bookId;
@end
