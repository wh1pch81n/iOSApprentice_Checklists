//
//  UIViewController_Extension.m
//  Checklists
//
//  Created by Derrick Ho on 1/31/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

#import "UIViewController_Extension.h"

@implementation UIViewController (EXT)

+ (instancetype)createFromStoryboard:(StoryboardName)name {
    NSBundle *b = [NSBundle bundleForClass:[self class]];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:b];
    NSString *vcName = NSStringFromClass([self class]);
    return [sb instantiateViewControllerWithIdentifier:vcName];
}

@end
