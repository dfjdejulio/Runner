//
//  JSEvalCommand.m
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "JSEvalCommand.h"

@implementation JSEvalCommand

#pragma mark Lifecycle

- (JSEvalCommand *) init
{
    self = [super init];
    jscontext = [JSContext new];
    return self;
}

#pragma mark Properties

- (NSString *) getName
{
    return @"JSEval";
}

#pragma mark Method

- (void) execute
{
    JSValue *result = [jscontext evaluateScript:self.input];
    output = [result toString];
}

@end
