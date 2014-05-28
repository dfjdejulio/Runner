//
//  JSEvalCommand.h
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "Command.h"
#import <JavaScriptCore/JavaScriptCore.h>

/**
 
 This command has a saved JavaScript context.  Each time it's executed,
 its input is evaluated in that context, and the result of that evaluation
 is returned in its output.
 
 */

@interface JSEvalCommand : Command {
    JSContext *jscontext;
}

/// The persistent JSContext object backing this command.
@property JSContext *context;

@end
