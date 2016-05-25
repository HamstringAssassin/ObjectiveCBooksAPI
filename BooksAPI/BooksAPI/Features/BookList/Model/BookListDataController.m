//
//  BookListDataController.m
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BookListDataController.h"
#import "BooksFetcher.h"
#import "BookModel.h"
#import "ShortBookModel.h"
#import "BookListViewModel.h"
#import "UIColor+BooksAPI.h"

NSString *const kBookListDataControllerDataLoadedNotification = @"BookListDataControllerDataLoadedNotification";

@interface BookListDataController ()
@property (nonatomic, strong) BooksFetcher *booksFetcher;
@end

@implementation BookListDataController

- (instancetype)initWithViewModelsHandler:(ViewModelsHandler) viewModelsHandler {
	self = [super init];
	if (self) {
		_booksFetcher = [BooksFetcher new];
		[_booksFetcher getBooks:^(NSArray *books) {
            [[NSNotificationCenter defaultCenter] postNotificationName:kBookListDataControllerDataLoadedNotification object:nil];
			NSArray *bookViewModels = [self viewModelsFromBooks:books];
			viewModelsHandler(bookViewModels);
		}];
	}
	return self;
}

- (NSArray *)viewModelsFromBooks:(NSArray *)models {
	NSMutableArray *viewModels = [NSMutableArray new];
	
	for (ShortBookModel *shortBookModel in models) {
		BookListViewModel *bookListViewModel = [BookListViewModel viewModelWithModel:shortBookModel];
        if ([models indexOfObject:shortBookModel] % 2 == 0) {
            bookListViewModel.backgroundColor = [UIColor primaryCellColor];
        } else {
            bookListViewModel.backgroundColor = [UIColor secondaryCellColor];
        }
		[viewModels addObject:bookListViewModel];
	}
	
	return viewModels.copy;
}

@end
