//
//  JSEvalCommand.h
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "Command.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface JSEvalCommand : Command {
    JSContext *jscontext;
}

@end
