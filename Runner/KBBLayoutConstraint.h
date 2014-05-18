//
//  KBBLayoutConstraint.h
//  Runner
//
//  Created by Doug DeJulio on 5/17/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 * The way you use this is, in your storyboard, have precisely one vertical
 * NSLayoutConstraint that touches the bottom layout guide.  Change the
 * class of that constraint to KBBlayoutConstraint.  When the storyboard is
 * loaded, the "awakeFromNib" method will register it for keyboard show/hide
 * events.  The "size" of the constraint will change by however much the top
 * of the keyboard changed.  Magic!
 *
 */

@interface KBBLayoutConstraint : NSLayoutConstraint

#pragma mark Keyboard Handling

- (void) keyboardWillChange: (NSNotification *)notification;

#pragma mark Lifecycle

- (void)awakeFromNib;

@end
