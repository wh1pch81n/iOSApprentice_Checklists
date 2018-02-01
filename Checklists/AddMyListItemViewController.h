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
- (void)addItemViewControllerDidCancel:(AddMyListItemViewController *_Nonnull)addItemViewController;
- (void)addItemViewController:(AddMyListItemViewController *_Nonnull)addItemViewController didFinishAddingItem:(MyListItem *_Nonnull)listItem;
@end

@interface AddMyListItemViewController : UITableViewController
@property (weak, nonatomic, nullable) id<AddMyListItemViewControllerDelegate> delegate;

@property (strong, nonatomic, nullable) MyListItem *listItemToEdit; // If this value is null, we are adding.  If it is nonnull it means we are editing.
@end
