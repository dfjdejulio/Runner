//
//  UITextView+BILogTextView.h
//  Runner
//
//  I often want to use a UITextVew basically as if it were stdout.
//  This Objective-C category lets me do that more easily and cleanly.
//
//  Created by Doug DeJulio on 2014-05-21.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (BILogTextView)

- (void) append:(NSString *)msg;
- (void) appendBold:(NSString *)msg;
- (void) scrollToBottom;
@end
