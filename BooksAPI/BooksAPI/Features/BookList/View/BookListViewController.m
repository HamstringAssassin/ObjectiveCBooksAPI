//
//  BookListViewController.m
//  BooksAPI
//
//  Created by Alan O'Connor on 11/05/2016.
//  Copyright © 2016 Alan O'Connor. All rights reserved.
//

#import "BookListViewController.h"
#import "BooksTableViewController.h"
#import "BookListDataController.h"

static NSString *const kBookListTableViewControllerNib = @"BooksTableViewController";

@interface BookListViewController ()
@property (weak, nonatomic) IBOutlet UIView *tableView;
@property (weak, nonatomic) IBOutlet UIView *spinnerView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@end

@implementation BookListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTableViewController];
    
	self.spinner.hidesWhenStopped = YES;
	[self.spinner startAnimating];
	
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTableView) name:kBookListDataControllerDataLoadedNotification object:nil];
}

- (void)addTableViewController {
    BooksTableViewController *booksTableViewController = [[BooksTableViewController alloc] initWithNibName:kBookListTableViewControllerNib bundle:nil];
    [self addChildViewController:booksTableViewController];
    [self.tableView addSubview:booksTableViewController.view];
    [booksTableViewController didMoveToParentViewController:self];
    
    self.tableView.alpha = 0;
}

- (void)showTableView {
    [UIView animateWithDuration:0.5 animations:^{
        [self.spinner stopAnimating];
        self.tableView.alpha = 1;
        self.spinnerView.alpha = 0;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
