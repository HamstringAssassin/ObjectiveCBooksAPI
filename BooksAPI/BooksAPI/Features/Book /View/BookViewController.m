//
//  BookViewController.m
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BookViewController.h"
#import "BookViewModel.h"
#import "BookViewDataController.h"
#import "UIFont+BooksAPI.h"
#import "UIColor+BooksAPI.h"

@interface BookViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bookCoverImageView;

@property (nonatomic, strong) BookViewDataController *bookViewDataController;

@property (nonatomic, strong) NSString *bookID;

@property (nonatomic, strong) BookViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UIView *spinnerView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UIView *bookView;
@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self)weakSelf = self;
    self.bookView.alpha = 0;
	self.spinnerView.backgroundColor = [UIColor defaultBackgroundColor];

    self.spinner.hidesWhenStopped = YES;
    [self.spinner startAnimating];
    
    _bookViewDataController = [[BookViewDataController alloc] initWithContext:self.bookID ViewModelsHandler:^(NSArray *viewModels) {
        weakSelf.viewModel = [viewModels firstObject];
    }];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)updateWithBookID:(NSString *)bookId {
    _bookID = bookId;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setViewModel:(BookViewModel *)viewModel {
    _viewModel = viewModel;
	[self setTitleLabelText:viewModel.bookTitle];
    [self setAuthorLabelText:viewModel.BookAuthor];
    [self setDescriptionLabelText:viewModel.bookFullDescription];
    [self setPriceLabelText:viewModel.bookPrice];
    [self.bookView setBackgroundColor:[UIColor defaultBackgroundColor]];
    
    [self updateBookCover:viewModel.bookCover];
    
    [self updateviewVisibility];
}

- (void) updateBookCover: (UIImage *)bookCover {
    self.bookCoverImageView.image = (bookCover.size.height > 1) ? bookCover : [UIImage imageNamed:@"defaultBookCover"];
}

- (void)updateviewVisibility {
    [self.spinner stopAnimating];
    [UIView animateWithDuration:0.5 animations:^{
        self.bookView.alpha = 1;
        self.spinnerView.alpha = 0;
    }];
}

- (void)setTitleLabelText:(NSString *)text {
	self.titleLabel.font = [UIFont arialBoldFontWithSize:16];
	self.titleLabel.text = text;
	self.titleLabel.textColor = [UIColor defaultTextColor];
}

- (void)setAuthorLabelText:(NSString *)text {
    self.authorLabel.text = text;
    [self.authorLabel setTextAlignment:NSTextAlignmentRight];
    self.authorLabel.font = [UIFont arialFontWithSize:14];
    self.authorLabel.textColor = [UIColor defaultTextColor];
}

- (void)setDescriptionLabelText:(NSString *)text {
    self.descriptionLabel.text = text;
    self.descriptionLabel.backgroundColor = [UIColor defaultBackgroundColor];
    self.descriptionLabel.font = [UIFont arialFontWithSize:14];
    self.descriptionLabel.textColor = [UIColor defaultTextColor];
}

- (void)setPriceLabelText:(NSString *)text {
    self.priceLabel.text = text;
    [self.priceLabel setTextAlignment:NSTextAlignmentRight];
    self.priceLabel.font = [UIFont arialFontWithSize:11];
    self.priceLabel.textColor = [UIColor defaultTextColor];
}

@end
