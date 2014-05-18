//
//  ViewController.h
//  Runner
//
//  Created by Doug DeJulio on 5/17/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefaultCommand.h"

@interface ViewController : UIViewController

#pragma mark Outlets

@property IBOutlet UITextView *output;
@property IBOutlet UITextField *input;
@property IBOutlet DefaultCommand *command;

#pragma mark Actions

- (IBAction) execute:(id)sender;


@end
