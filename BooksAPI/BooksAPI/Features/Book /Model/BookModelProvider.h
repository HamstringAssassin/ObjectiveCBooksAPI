//
//  BookModelProvider.h
//  BooksAPI
//
//  Created by Alan O'Connor on 26/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookModel.h"

@interface BookModelProvider : NSObject

+(BookModel *)modelFromData:(NSArray *)data;

@end
