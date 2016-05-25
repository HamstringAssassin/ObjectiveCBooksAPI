//
//  BookListViewModel.m
//  BooksAPI
//
//  Created by O'Connor, Alan on 10/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BookListViewModel.h"
#import "ShortBookModel.h"

@interface BookListViewModel ()
@property (nonatomic, strong, readwrite) ShortBookModel *model;

@property (nonatomic, strong, readwrite) NSString *bookTitle;
@property (nonatomic, strong, readwrite) NSString *bookAuthor;

@end

@implementation BookListViewModel

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

- (void) updateWithModel:(id<DataModel>)model {
    if ([model isKindOfClass:[ShortBookModel class]]) {
        ShortBookModel *shortBookModel = (ShortBookModel *)model;
        _model = shortBookModel;
        _bookId = [shortBookModel.ID stringValue];
        _bookTitle = shortBookModel.title;
        _bookAuthor = shortBookModel.author;
        
    }
}

- (CGFloat)cellHeight {
    return 80.0;
}

- (NSString *)cellIdentifier {
    return @"BookListTableViewCell";
}

@end
