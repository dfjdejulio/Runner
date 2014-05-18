//
//  ViewController.m
//  Runner
//
//  Created by Doug DeJulio on 5/17/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "ViewController.h"
#import "DefaultCommand.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark Lifecycle

- (void) awakeFromNib
{
    // If you grow up in a nib file, this is your init.
    self.command = [DefaultCommand new];
}

#pragma mark Actions

- (IBAction)execute:(id)sender
{
    self.command.input = self.input.text;
    [self.command execute];
    NSMutableString *outputBuffer = [[NSMutableString alloc] initWithString:self.output.text];
    [outputBuffer appendString:self.command.output];
    [outputBuffer appendString:@"\n"];
    self.output.text = outputBuffer;
    [self.output scrollRangeToVisible:NSMakeRange(self.output.text.length, 0)];
}

@end
