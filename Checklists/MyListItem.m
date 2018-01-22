//
//  MyListItem.m
//  Checklists
//
//  Created by Derrick Ho on 1/21/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

#import "MyListItem.h"

@implementation MyListItem

- (instancetype)initWithString:(NSString *)name checkMarkValue:(BOOL)checked {
    if (self = [super init]) {
        self->_text = name;
        self->_checked = checked;
    }
    return self;
}

- (void)toggleCheck {
    self.checked = !self.checked;
}

@end
