//
//  DefaultCommand.h
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Command.h"

#define HELLO_SAILOR_STRING @"Hello, %@!"

/**
 
 A trivial command, saying "hello" to its input.
 
 */

@interface HelloSailorCommand : Command

/// The format string to use on the input.
@property (copy, nonatomic) NSString *format;

@end
