//
//  BookViewDataController.m
//  BooksAPI
//
//  Created by Alan O'Connor on 10/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BookViewDataController.h"
#import "BookViewModel.h"
#import "BookModel.h"
#import "BookFetcher.h"
#import "BookModelProvider.h"

@interface BookViewDataController ()
@property (nonatomic, strong) BookFetcher *bookFetcher;
@end

@implementation BookViewDataController

- (instancetype)initWithContext:(NSString *)context ViewModelsHandler:(ViewModelsHandler) viewModelsHandler {
    self = [super init];
    if (self) {
        _bookFetcher = [BookFetcher new];
        
        [_bookFetcher bookDataWithId:context andHandler:^(id data) {
            if ([data isKindOfClass:[NSArray class]]) {
                BookModel *bookModel = [BookModelProvider modelFromData:(NSArray *)data];
                BookViewModel *bookViewModel = [self viewModelsFromBook:bookModel];
                viewModelsHandler(@[bookViewModel]);
            }
        }];
}
    return self;
}

- (BookViewModel *)viewModelsFromBook:(BookModel *)bookModel {
    BookViewModel *viewModel = [BookViewModel viewModelWithModel:bookModel];
    return viewModel;
}


@end
