//
//  BooksTableViewController.m
//  BooksAPI
//
//  Created by Alan O'Connor on 09/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BooksTableViewController.h"
#import "BookViewController.h"
#import "BooksFetcher.h"
#import "BookListDataController.h"
#import "BookListViewModel.h"
#import "BookListTableViewCell.h"
#import "BookViewDataController.h"
#import "BookViewModel.h"

static NSString *const kBookListTableViewCellNib = @"BookListTableViewCell";
static NSString *const kBookViewControllerNib = @"BookViewController";

@interface BooksTableViewController ()
@property (strong, nonatomic) BookListDataController *bookListDataController;
@property (strong, nonatomic) NSArray *viewModels;
@end

@implementation BooksTableViewController

- (void)viewDidLoad {
    __weak typeof(self)weakSelf = self;
    _bookListDataController = [[BookListDataController alloc] initWithViewModelsHandler:^(NSArray *booksViewModels) {
        weakSelf.viewModels = booksViewModels;
        weakSelf.tableView.hidden = NO;
        [weakSelf.tableView reloadData];
    }];
    
    [self registerNib];
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)registerNib {
	UINib *nib = [UINib nibWithNibName:kBookListTableViewCellNib bundle:nil];
	[self.tableView registerNib:nib forCellReuseIdentifier:kBookListTableViewCellNib];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	BookListViewModel *viewModel = self.viewModels[indexPath.row];
    BookListTableViewCell *bookListTableViewCell = [tableView dequeueReusableCellWithIdentifier:viewModel.cellIdentifier forIndexPath:indexPath];
	[bookListTableViewCell setViewModel:viewModel];
	[bookListTableViewCell layoutIfNeeded];
	
    return bookListTableViewCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [[self.viewModels objectAtIndex:indexPath.row] cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BookViewController *bookViewController = [[BookViewController alloc] initWithNibName:kBookViewControllerNib bundle:nil];
    BookListViewModel *viewModel = [self.viewModels objectAtIndex:indexPath.row];
    [bookViewController updateWithBookID:viewModel.bookId];
    [self.navigationController pushViewController:bookViewController animated:YES];
}

@end
