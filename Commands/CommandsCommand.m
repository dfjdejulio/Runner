//
//  CommandsCommand.m
//  Runner
//
//  Created by Doug DeJulio on 5/27/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "CommandsCommand.h"

@implementation CommandsCommand

-(void)addCommand:(Command *)cmd
{
    [self addCommand:cmd withName:cmd.name];
}

-(void)addCommand:(Command *)cmd withName:(NSString *)cmdname
{
    commands[cmdname] = cmd;
}

-(CommandsCommand *)init
{
    self = [super init];
    commands = [NSMutableDictionary new];
    name = @"Commands";
    return self;
}

-(void)execute
{
    NSString *cmdname, *cmdargs;
    NSRange firstSpace = [self.input rangeOfString:@" "];
    // If no space, interpet as command with no args.
    if (firstSpace.location == NSNotFound) {
        cmdname = self.input;
        cmdargs = @"";
    } else {
        cmdname = [self.input substringToIndex:firstSpace.location];
        cmdargs = [self.input substringFromIndex:firstSpace.location + firstSpace.length];
    }
    Command *cmd = commands[cmdname];
    if (!cmd) {
        output = [NSString stringWithFormat:@"Command \"%@\" not found in %@.", cmdname, commands.allKeys];
    } else {
        cmd.input = cmdargs;
        [cmd execute];
        output = [NSString stringWithFormat:@"%@: %@", cmdname, cmd.output];
    }
}

@end
