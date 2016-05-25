//
//  DataModel.h
//  BooksAPI
//
//  Created by Alan O'Connor on 10/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataModel <NSObject>
/**
 *  creates a DataModel with a given NSDictionary
 *
 *  @param data an NSDictionary
 *
 *  @return a DataModel
 */
- (instancetype)initWithData:(NSDictionary *)data;

@end
