//
//  ViewController.m
//  Runner
//
//  Created by Doug DeJulio on 5/17/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "ViewController.h"
#import "HelloSailorCommand.h"
#import "JSEvalCommand.h"
#import "ScreenTestCommand.h"
#import "CommandsCommand.h"
#import "UITextView+BILogTextView.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark Lifecycle

- (void) awakeFromNib
{
    // If you grow up in a nib file, this is your init.
    CommandsCommand *cmd = [CommandsCommand new];
    // Add three commands with their default names.
    [cmd addCommand:[HelloSailorCommand new]];
    [cmd addCommand:[JSEvalCommand new]];
    [cmd addCommand:[ScreenTestCommand new]];
    // ...and this is an example of why you might use a non-default name.
    HelloSailorCommand *goodbye = [HelloSailorCommand new];
    goodbye.format = @"So long, %@!";
    [cmd addCommand:goodbye withName:@"Goodbye"];
    self.command = cmd;
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
