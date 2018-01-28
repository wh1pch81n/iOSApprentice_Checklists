//
//  AddMyListItemViewController.h
//  Checklists
//
//  Created by Derrick Ho on 1/26/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyListItem;
@class AddMyListItemViewController;

@protocol AddMyListItemViewControllerDelegate <NSObject>
- (void)addItemViewControllerDidCancel:(AddMyListItemViewController *)addItemViewController;
- (void)addItemViewController:(AddMyListItemViewController *)addItemViewController didFinishAddingItem:(MyListItem *)listItem;
@end

@interface AddMyListItemViewController : UITableViewController
@property (weak, nonatomic) id<AddMyListItemViewControllerDelegate> delegate;
@end
