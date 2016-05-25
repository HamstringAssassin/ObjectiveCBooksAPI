//
//  ShortBookModel.m
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "ShortBookModel.h"

static NSString *const kShortBookModelID = @"id";
static NSString *const kShortBookModelTitle = @"title";
static NSString *const kShortBookModelISBN = @"isbn";
static NSString *const kShortBookModelPrice = @"price";
static NSString *const kShortBookModelCurrencyCode = @"currencyCode";
static NSString *const kShortBookModelAuthor = @"author";


@interface ShortBookModel ()
@property(nonatomic, readwrite) NSNumber *ID;
@property(nonatomic, readwrite) NSString *title;
@property(nonatomic, readwrite) NSString *isbn;
@property(nonatomic, readwrite) NSNumber *price;
@property(nonatomic, readwrite) NSString *currencyCode;
@property(nonatomic, readwrite) NSString *author;
@end

@implementation ShortBookModel

- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
		_ID = data[kShortBookModelID];
		_title = data[kShortBookModelTitle];
		_isbn = data[kShortBookModelISBN];
		_price = data[kShortBookModelPrice];
		_currencyCode = data[kShortBookModelCurrencyCode];
		_author = data[kShortBookModelAuthor];
    }
    return self;
}

@end
