//
//  DefaultCommand.m
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "DefaultCommand.h"

@implementation DefaultCommand

@synthesize input;
@synthesize output = output;

- (void) execute
{
    output = [NSString stringWithFormat:@"Hello, %@!", self.input];
}

@end
