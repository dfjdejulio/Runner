//
//  CommandsCommand.h
//  Runner
//
//  Created by Doug DeJulio on 5/27/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "Command.h"

/**
 
 This is a container for multiple commands.  Each command has a matching
 string.  The input up to the first space is matched against those strings,
 and if one is found, the rest of the string is used as the input for the
 matching command.
 
 */
@interface CommandsCommand : Command {
    @protected NSMutableDictionary *commands;
}

/** Add a command using its default name.
 @param cmd The command to add.
 */
- (void) addCommand:(Command *)cmd;
/** Add a command with a specified name.
 @param cmd The command to add.
 @param name The name to use for the command.
 */
- (void) addCommand:(Command *)cmd withName:(NSString *)name;

@end
