//
//  MyListsViewController.m
//  Checklists
//
//  Created by Derrick Ho on 1/21/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

#import "MyListsViewController.h"
#import "MyListsTableViewCell.h"

@interface MyListsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *arrayOfText;
@end

@implementation MyListsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.arrayOfText = @[
                         @"Walk the dog"
                         , @"Brush my teeth"
                         , @"Learn iOS development"
                         , @"Soccer practice"
                         , @"Eat ice cream"
                         ];
}

#pragma mark - TableView Data Source and Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyListsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyListsTableViewCell" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    cell.listName.text = [NSString stringWithFormat:@"%ld) %@", (long)row, self.arrayOfText[row % self.arrayOfText.count]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if ((cell = [tableView cellForRowAtIndexPath:indexPath])) {
        if (cell.accessoryType == UITableViewCellAccessoryNone) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
    }
}

@end
