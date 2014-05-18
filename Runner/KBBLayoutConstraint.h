//
//  KBBLayoutConstraint.h
//  Runner
//
//  Created by Doug DeJulio on 5/17/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KBBLayoutConstraint : NSLayoutConstraint

#pragma mark Keyboard Handling

- (void) keyboardWillChange: (NSNotification *)notification;

#pragma mark Lifecycle

- (void)awakeFromNib;

@end
