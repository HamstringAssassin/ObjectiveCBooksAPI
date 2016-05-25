//
//  BookServerURLReader.m
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BookServerURLReader.h"

static NSString *const kBookServerURLPlist = @"BooksServerURLs";

static NSString *const kAllBooksURLKey = @"BookList";
static NSString *const kSingleBookURLKey = @"Book";
static NSString *const kBookCoverURLKey = @"BookCover";

@interface BookServerURLReader ()
@property (nonatomic, strong) NSString *filePath;
@property (nonatomic, strong) NSDictionary *settings;
@end

@implementation BookServerURLReader

+ (id)bookServerURLReaderSingleton {
    static BookServerURLReader *bookServerURLReader = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bookServerURLReader = [[self alloc] init];
    });
    return bookServerURLReader;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _filePath = [[NSBundle mainBundle] pathForResource:@"BookServerURLs" ofType:@"plist"];
        _settings = [NSDictionary dictionaryWithContentsOfFile:_filePath];
    }
    return self;
}

- (NSURL *)bookListURL {
    return [NSURL URLWithString:[self.settings objectForKey:kAllBooksURLKey]];
}

- (NSURL *)urlForBookId:(NSString *)bookId {
    NSString *singleBookURL = [[self.settings objectForKey:kSingleBookURLKey] stringByReplacingOccurrencesOfString:@"*" withString:bookId];
    return [NSURL URLWithString:singleBookURL];
}

- (NSURL *)bookCoverURLWithISBN:(NSString *)isbn {
    NSString *bookServerURL = [[self.settings objectForKey:kBookCoverURLKey] stringByReplacingOccurrencesOfString:@"*" withString:isbn];
    return [NSURL URLWithString:bookServerURL];
}

@end
