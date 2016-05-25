//
//  BookModel.m
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BookModel.h"

static NSString *const kID = @"id";
static NSString *const kTitle = @"title";
static NSString *const kISBN = @"isbn";
static NSString *const kBookDescription = @"description";
static NSString *const kPrice = @"price";
static NSString *const kCurrency = @"currencyCode";
static NSString *const kAuthor = @"author";

@interface BookModel ()
@property (nonatomic, readwrite) NSNumber *ID;
@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) NSString *isbn;
@property (nonatomic, readwrite) NSString *bookDescription;
@property (nonatomic, readwrite) NSNumber *price;
@property (nonatomic, readwrite) NSString *currency;
@property (nonatomic, readwrite) NSString *author;
@property (nonatomic, readwrite) NSData *bookCoverData;
@end

@implementation BookModel

- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        _ID = data[kID];
        _title = data[kTitle];
        _isbn = data[kISBN];
        _bookDescription = data[kBookDescription];
        _price = data[kPrice];
        _currency = data[kCurrency];
        _author = data[kAuthor];
    }
    return self;
}

- (void)updateCoverData:(NSData *)coverData {
    _bookCoverData = coverData;
}

@end
