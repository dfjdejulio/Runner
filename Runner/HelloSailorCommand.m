//
//  DefaultCommand.m
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "HelloSailorCommand.h"

@implementation HelloSailorCommand

@synthesize output = output;

- (NSString *) getName
{
    return @"HelloSailor";
}

- (void) execute
{
    output = [NSString stringWithFormat:@"Hello, %@!", self.input];
}

@end
