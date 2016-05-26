//
//  BookModelProvider.m
//  BooksAPI
//
//  Created by Alan O'Connor on 26/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BookModelProvider.h"
#import "BookServerURLReader.h"

@implementation BookModelProvider

+(BookModel *)modelFromData:(NSArray *)data {
    NSMutableArray *bookArray = [NSMutableArray new];
    for (NSDictionary *bookData in data) {
        BookModel *bookModel = [[BookModel alloc] initWithData:bookData];
        [self updateBookModelWithCover:bookModel];
        [bookArray addObject:bookModel];
    }
    return bookArray.copy;
}

+ (void)updateBookModelWithCover:(BookModel *)bookModel {
    if (bookModel.isbn) {
        [bookModel updateCoverData:[self bookCoverWithISBN:bookModel.isbn]];
    }
}

+ (NSData *)bookCoverWithISBN:(NSString *)isbn {
    NSURL *bookCoverURL = [[BookServerURLReader bookServerURLReaderSingleton] bookCoverURLWithISBN:isbn];
    NSData *imageData = [NSData dataWithContentsOfURL:bookCoverURL];
    return imageData;
}

+ (NSDictionary *) handleErrorMessage {
    return @{@"description":@"uh-oh... Something went wrong. Unknown Book."};
}


@end