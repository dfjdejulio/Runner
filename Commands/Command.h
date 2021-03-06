//
//  Command.h
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

/**
 These are made available to JavaScriptCore, if a command object is bridged
 to JavaScript.
 */

@protocol CommandExports <JSExport>

/// The command's input.
@property (readwrite, copy) NSString *input;
/// The command's output.
@property (readonly, copy) NSString *output;
/// The command's name, only used in some environments.
@property (readonly, nonatomic) NSString *name;

/// Execute the command
- (void) execute;

@end

/**

 This is the base for all "Command" objects.

 */

@interface Command : NSObject <CommandExports> {
    @protected NSString *output;
    @protected NSString *name;
}

/// The command's input.
@property (readwrite, copy) NSString *input;
/// The command's output.
@property (readonly, copy) NSString *output;
/// The command's name, only used in some environments.
@property (readonly, nonatomic) NSString *name;

/// Execute the command
- (void) execute;

@end
