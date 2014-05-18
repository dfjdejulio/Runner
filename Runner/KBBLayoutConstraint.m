//
//  KBBLayoutConstraint.m
//  Runner
//
//  Created by Doug DeJulio on 5/17/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "KBBLayoutConstraint.h"

@implementation KBBLayoutConstraint

- (void) awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark Keyboard Handling

- (void) keyboardWillChange: (NSNotification *)notification
{
    CGRect rawBeforeRect = [notification.userInfo[@"UIKeyboardFrameBeginUserInfoKey"] CGRectValue];
    CGRect rawAfterRect = [notification.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];

    CGRect beforeRect = [self.firstItem convertRect: rawBeforeRect fromView:nil];
    CGRect afterRect = [self.firstItem convertRect: rawAfterRect fromView:nil];

    // How far did the top of the keyboard move?
    CGFloat deltaY = beforeRect.origin.y - afterRect.origin.y;

    // Adjust the bottom constraint by that much.
    self.constant += deltaY;

    return;
}

@end
