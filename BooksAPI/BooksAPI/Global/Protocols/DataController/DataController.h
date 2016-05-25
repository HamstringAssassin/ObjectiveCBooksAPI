//
//  DataController.h
//  BooksAPI
//
//  Created by Alan O'Connor on 10/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  ViewModels Handler
 *
 *  @param viewModels array of viewModels
 */
typedef void (^ViewModelsHandler)(NSArray *viewModels);

@protocol DataController <NSObject>

@optional
/**
 *  creates a dataController with a return handler
 *
 *  @param viewModelsHandler a viewModels Handler
 *
 *  @return a data controller
 */
- (instancetype)initWithViewModelsHandler:(ViewModelsHandler) viewModelsHandler;

/**
 *  creates a dataController with a return Handler
 *
 *  @param context           a specific context for the dataController
 *  @param viewModelsHandler a viewModels Handler
 *
 *  @return a dataController
 */
- (instancetype)initWithContext:(id)context ViewModelsHandler:(ViewModelsHandler) viewModelsHandler;

@end
