//
//  BookViewModel.m
//  BooksAPI
//
//  Created by Alan O'Connor on 10/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BookViewModel.h"
#import "BookModel.h"

@interface BookViewModel ()

@property (nonatomic, readwrite) BookModel *model;

@property (nonatomic, readwrite) NSNumber *bookId;
@property (nonatomic, readwrite) NSString *bookTitle;
@property (nonatomic, readwrite) NSString *bookIsbn;
@property (nonatomic, readwrite) NSString *bookFullDescription;
@property (nonatomic, readwrite) NSString *bookPrice;
@property (nonatomic, readwrite) NSString *bookCurrency;
@property (nonatomic, readwrite) NSString *BookAuthor;

@property (nonatomic, readwrite) UIImage *bookCover;
@end

@implementation BookViewModel

+ (instancetype)viewModelWithModel:(id<DataModel>)model {
    return [[self alloc] initWithModel:model];
}

- (instancetype)initWithModel:(id<DataModel>)model {
    self = [super init];
    if (self) {
        [self updateWithModel:model];
    }
    return self;
}

- (void)updateWithModel:(id<DataModel>)model {
    if ([model isKindOfClass:[BookModel class]]) {
        BookModel *bookModel = model;
        _model = bookModel;
        _bookId = bookModel.ID;
        _bookTitle = bookModel.title;
        _bookIsbn = bookModel.isbn;
        _bookFullDescription = bookModel.bookDescription;
        _bookPrice = [self updatePrice:bookModel.price withCurrency:bookModel.currency];
        _BookAuthor = bookModel.author;
        _bookCurrency = bookModel.currency;
        _bookCover = [self updateBookCoverWithData:bookModel.bookCoverData];
    }
}

- (UIImage *) updateBookCoverWithData:(NSData *)bookCoverData {
    return [UIImage imageWithData:bookCoverData];
}

- (NSString *)updatePrice:(NSNumber *)price withCurrency:(NSString *)currencyCode {
    NSNumber *bookPriceInDecimal = [NSNumber numberWithDouble:(price.doubleValue / 100)];
    
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:currencyCode];
    
    NSString *currencySymbol = [NSString stringWithFormat:@"%@",[locale displayNameForKey:NSLocaleCurrencySymbol value:currencyCode]];
    
    return [NSString stringWithFormat:@"%@%@", currencySymbol, bookPriceInDecimal.stringValue];
}

@end
