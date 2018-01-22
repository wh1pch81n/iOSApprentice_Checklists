//
//  MyListItem.h
//  Checklists
//
//  Created by Derrick Ho on 1/21/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyListItem : NSObject
@property (strong, nonatomic) NSString *text;
@property (assign, nonatomic) BOOL checked;

- (instancetype)initWithString:(NSString *)name checkMarkValue:(BOOL)checked;
- (void)toggleCheck;

@end
