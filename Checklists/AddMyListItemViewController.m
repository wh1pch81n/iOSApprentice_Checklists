//
//  AddMyListItemViewController.m
//  Checklists
//
//  Created by Derrick Ho on 1/26/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

#import "AddMyListItemViewController.h"
#import "MyListItem.h"

@interface AddMyListItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation AddMyListItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (_listItemToEdit) {
        self.navigationItem.title = @"Edit Item";
        self.textField.text = _listItemToEdit.text;
    }
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.textField becomeFirstResponder];
}

- (void)enableDoneButtonBasedOnTextfieldText {
    self.navigationItem.rightBarButtonItem.enabled = (self.textField.text.length) ? YES : NO;
}

#pragma mark - TableView Delegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - Navigation

- (IBAction)tappedCancel:(id)sender {
    [self.delegate addItemViewControllerDidCancel:self];
}

- (IBAction)tappedDone:(id)sender {
    MyListItem *listItem = [[MyListItem alloc] initWithString:self.textField.text checkMarkValue:NO];
    [self.delegate addItemViewController:self didFinishAddingItem:listItem];
}

#pragma mark - Textfield delegate

- (IBAction)textfieldDidEdit:(id)sender {
    [self enableDoneButtonBasedOnTextfieldText];
}

@end
