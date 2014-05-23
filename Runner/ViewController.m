//
//  ViewController.m
//  Runner
//
//  Created by Doug DeJulio on 5/17/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "ViewController.h"
#import "JSEvalCommand.h"
#import "UITextView+BILogTextView.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark Lifecycle

- (void) awakeFromNib
{
    // If you grow up in a nib file, this is your init.
    self.command = [JSEvalCommand new];
}

#pragma mark Actions

- (IBAction)execute:(id)sender
{
    self.command.input = self.input.text;
    [self.command execute];

    [self.output appendBold: self.command.input];
    [self.output appendBold: @" → "];
    [self.output append: self.command.output];
    [self.output append: @"\n"];
}

@end
