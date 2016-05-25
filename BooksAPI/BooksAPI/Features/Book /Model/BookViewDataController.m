//
//  BookViewDataController.m
//  BooksAPI
//
//  Created by Alan O'Connor on 10/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BookViewDataController.h"
#import "BooksFetcher.h"
#import "BookViewModel.h"
#import "BookModel.h"

@interface BookViewDataController ()
@property (nonatomic, readwrite, strong) BooksFetcher *booksFetcher;
@end

@implementation BookViewDataController

- (instancetype)initWithContext:(NSString *)context ViewModelsHandler:(ViewModelsHandler) viewModelsHandler {
    self = [super init];
    if (self) {
        _booksFetcher = [BooksFetcher new];
        [_booksFetcher bookModelWithId:context handler:^(NSArray *books) {
            BookViewModel *bookViewModel = [self viewModelsFromBook:[books firstObject]];
            viewModelsHandler(@[bookViewModel]);
        }];
    }
    return self;
}

- (BookViewModel *)viewModelsFromBook:(BookModel *)bookModel {
    BookViewModel *viewModel = [BookViewModel viewModelWithModel:bookModel];
    return viewModel;
}


@end
