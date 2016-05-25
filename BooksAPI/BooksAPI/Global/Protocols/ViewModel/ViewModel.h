//
//  ViewModel.h
//  BooksAPI
//
//  Created by Alan O'Connor on 10/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModel.h"

@protocol ViewModel <NSObject>

/**
 *  creates a viewModel from a given model
 *
 *  @param model a DataModel model
 *
 *  @return a View Model
 */
+ (instancetype)viewModelWithModel:(id<DataModel>)model;

@end
