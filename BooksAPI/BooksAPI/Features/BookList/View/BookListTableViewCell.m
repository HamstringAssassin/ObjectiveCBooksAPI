//
//  BookListTableViewCell.m
//  BooksAPI
//
//  Created by O'Connor, Alan on 10/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BookListTableViewCell.h"
#import "BookListViewModel.h"
#import "UIColor+BooksAPI.h"
#import "UIFont+BooksAPI.h"

@interface BookListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *spacerView;
@property (strong, nonatomic) BookListViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation BookListTableViewCell

- (void)setViewModel:(BookListViewModel*)viewModel {
	_viewModel = viewModel;
	[self updateAuthorLabelWithAuthor:viewModel.bookAuthor];
    [self updateTitleLabelWithTitle:viewModel.bookTitle];
	self.titleLabel.text = viewModel.bookTitle;
    self.backgroundColor = viewModel.backgroundColor;
    self.spacerView.backgroundColor = [UIColor cellSpacerColor];
}

- (void)updateAuthorLabelWithAuthor:(NSString *)author {
    self.authorLabel.text = author;
    self.authorLabel.textColor = [UIColor defaultTextColor];
    self.authorLabel.font = [UIFont arialFontWithSize:13];
}

- (void)updateTitleLabelWithTitle:(NSString *)title {
    self.titleLabel.text = title;
    self.titleLabel.textColor = [UIColor defaultTextColor];
    self.titleLabel.font = [UIFont arialBoldFontWithSize:16];
}

@end
