//
//  DefaultCommand.m
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "HelloSailorCommand.h"

@implementation HelloSailorCommand

- (void) execute
{
    output = [NSString stringWithFormat:self.format, self.input];
}

- (HelloSailorCommand *) init
{
    self = [super init];
    _format = HELLO_SAILOR_STRING;
    name = @"Hello";
    return self;
}

@end
