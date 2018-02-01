//
//  UIViewController_Extension.h
//  Checklists
//
//  Created by Derrick Ho on 1/31/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString * StoryboardName NS_TYPED_ENUM;
static StoryboardName const StoryboardNameMain = @"Main";

@interface UIViewController (EXT)

+ (instancetype)createFromStoryboard:(StoryboardName)name;

@end
