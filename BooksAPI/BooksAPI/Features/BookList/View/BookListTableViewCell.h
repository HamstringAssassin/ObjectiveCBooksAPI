//
//  BookListTableViewCell.h
//  BooksAPI
//
//  Created by O'Connor, Alan on 10/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookListViewModel.h"

@interface BookListTableViewCell : UITableViewCell

/**
 *  sets UITableViewCells ViewModel
 *
 *  @param viewModel a viewModel
 */
- (void)setViewModel:(BookListViewModel*)viewModel;

@end
