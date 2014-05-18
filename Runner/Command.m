//
//  Command.h
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "Command.h"

@implementation Command

- (NSString *) getName
{
    return @"_bogus_garbage";
}

- (void) execute
{
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

@end