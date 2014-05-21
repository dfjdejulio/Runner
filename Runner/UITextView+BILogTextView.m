//
//  UITextView+BILogTextView.m
//  Runner
//
//  Created by Doug DeJulio on 2014-05-21.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "UITextView+BILogTextView.h"

@implementation UITextView (BILogTextView)

- (void) append:(NSString *)msg
{
    static NSDictionary *fontDict = nil;
    if (!fontDict) {
        fontDict = @{NSFontAttributeName: [UIFont systemFontOfSize:[UIFont systemFontSize]]};
    }
    NSAttributedString *as = [[NSAttributedString alloc] initWithString:msg attributes:fontDict];
    [self.textStorage appendAttributedString:as];
    [self scrollToBottom];
}

- (void) appendBold:(NSString *)msg
{
    static NSDictionary *fontDict = nil;
    if (!fontDict) {
        fontDict = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:[UIFont systemFontSize]]};
    }
    NSAttributedString *as = [[NSAttributedString alloc] initWithString:msg attributes:fontDict];
    [self.textStorage appendAttributedString:as];
    [self scrollToBottom];
}

- (void) scrollToBottom
{
    NSRange end = { self.attributedText.length, 0 };
    [self scrollRangeToVisible:end];
}

@end
