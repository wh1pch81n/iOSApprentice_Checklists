//
//  MyListsTableViewCell.m
//  Checklists
//
//  Created by Derrick Ho on 1/21/18.
//  Copyright © 2018 Derrick Ho. All rights reserved.
//

#import "MyListsTableViewCell.h"

@interface MyListsTableViewCell ()
@property (nonatomic, strong) IBOutlet UILabel *checkmark;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *checkmarkWidthConstraint;
@end

@implementation MyListsTableViewCell {
    BOOL _checkmarkVisible;
}

- (BOOL)checkmarkVisible {
    return _checkmarkVisible;
}

- (void)setCheckmarkVisible:(BOOL)checkmarkVisible {
    _checkmarkVisible  = checkmarkVisible;
    if (_checkmarkVisible) {
        _checkmarkWidthConstraint.active = NO;
    } else {
        _checkmarkWidthConstraint.active = YES;
        _checkmarkWidthConstraint.constant = 0;
    }
    [UIView animateWithDuration:0.3 animations:^{
        [self.contentView layoutIfNeeded];
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
