//
//  ViewController.h
//  Runner
//
//  Created by Doug DeJulio on 5/17/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBBLayoutConstraint.h"

@interface ViewController : UIViewController

#pragma mark Outlets

@property IBOutlet UITextView *output;
@property IBOutlet UITextField *input;

#pragma mark Actions

- (IBAction) execute:(id)sender;


@end
