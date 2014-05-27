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


/**
 
 Extends the UITextView object with methods useful to people accustomed
 to working with stdout and the like.
 
 */

@interface UITextView (BILogTextView)

/**
 
 Append some text to the view, using the standard system font.
 
 @param msg The message.
 
 */
- (void) append:(NSString *)msg;
/**
 
 Append some text to the view, using the standard bold system font.
 
 @param msg The message.
 
 */
- (void) appendBold:(NSString *)msg;
/// Scroll to the bottom of this view.
- (void) scrollToBottom;
@end
