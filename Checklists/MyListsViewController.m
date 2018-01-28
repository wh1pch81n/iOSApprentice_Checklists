//
//  MyListsViewController.m
//  Checklists
//
//  Created by Derrick Ho on 1/21/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

#import "MyListsViewController.h"
#import "MyListsTableViewCell.h"
#import "MyListItem.h"
#import "AddMyListItemViewController.h"

@interface MyListsViewController () <UITableViewDataSource, UITableViewDelegate, AddMyListItemViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray <MyListItem *>*arrayOfItems;

@end

@implementation MyListsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.arrayOfItems = @[
                         [[MyListItem alloc] initWithString:@"Walk the dog" checkMarkValue:NO]
                         , [[MyListItem alloc] initWithString:@"Brush my teeth" checkMarkValue:NO]
                         , [[MyListItem alloc] initWithString:@"Learn iOS development" checkMarkValue:NO]
                         , [[MyListItem alloc] initWithString:@"Soccer practice" checkMarkValue:NO]
                         , [[MyListItem alloc] initWithString:@"Eat ice cream" checkMarkValue:NO]
                         , [[MyListItem alloc] initWithString:@"Go to sleep" checkMarkValue:NO]
                         ];
    
    self.navigationController.navigationBar.prefersLargeTitles = true;
}

#pragma mark - TableView Data Source and Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayOfItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyListsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyListsTableViewCell" forIndexPath:indexPath];
    
    NSInteger row = indexPath.row;
    MyListItem *item = self.arrayOfItems[row];
    cell.listName.text = [NSString stringWithFormat:@"%ld) %@", (long)row, item.text];
    
    BOOL checkmarkExists = item.checked;
    
    if (checkmarkExists) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    MyListItem *item = self.arrayOfItems[row];
    [item toggleCheck];
    
    UITableViewCell *cell;
    if ((cell = [tableView cellForRowAtIndexPath:indexPath])) {
        cell.accessoryType = item.checked ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *copy = self.arrayOfItems.mutableCopy;
        [copy removeObjectAtIndex:indexPath.row];
        self.arrayOfItems = [NSArray arrayWithArray:copy];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - AddMyListItemViewControllerDelegate

- (void)addItemViewControllerDidCancel:(AddMyListItemViewController *)addItemViewController
{
    
}

- (void)addItemViewController:(AddMyListItemViewController *)addItemViewController didFinishAddingItem:(MyListItem *)listItem
{
    [self appendListItem:listItem];
}

#pragma mark - Actions

- (IBAction)addItem:(id)sender {
    MyListItem *newItem = [[MyListItem alloc] initWithString:@"New Item" checkMarkValue:YES];
    
    [self appendListItem:newItem];
}

- (void)appendListItem:(MyListItem *)listItem
{
    self.arrayOfItems = [self.arrayOfItems arrayByAddingObject:listItem];
    
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.arrayOfItems.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[AddMyListItemViewController class]])
    {
        AddMyListItemViewController *addListVC = segue.destinationViewController;
        
        addListVC.delegate = self;
    }
}

@end
