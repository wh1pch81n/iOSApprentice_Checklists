//
//  AddMyListItemViewController.m
//  Checklists
//
//  Created by Derrick Ho on 1/26/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

#import "AddMyListItemViewController.h"

@interface AddMyListItemViewController ()

@end

@implementation AddMyListItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
}

#pragma mark - TableView Delegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - Navigation

- (IBAction)tappedCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)tappedDone:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
