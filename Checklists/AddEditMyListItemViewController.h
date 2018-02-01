//
//  AddMyListItemViewController.h
//  Checklists
//
//  Created by Derrick Ho on 1/26/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyListItem;
@class AddEditMyListItemViewController;

@protocol AddEditMyListItemViewControllerDelegate <NSObject>
- (void)addItemViewControllerDidCancel:(AddEditMyListItemViewController *_Nonnull)addItemViewController;
- (void)addItemViewController:(AddEditMyListItemViewController *_Nonnull)addItemViewController didFinishAddingItem:(MyListItem *_Nonnull)listItem;
- (void)addItemViewController:(AddEditMyListItemViewController *_Nonnull)addItemViewController didFinishEditingItem:(MyListItem *_Nonnull)listItem;
@end

@interface AddEditMyListItemViewController : UITableViewController
@property (weak, nonatomic, nullable) id<AddEditMyListItemViewControllerDelegate> delegate;

@property (strong, nonatomic, nullable) MyListItem *listItemToEdit; // If this value is null, we are adding.  If it is nonnull it means we are editing.
@end
