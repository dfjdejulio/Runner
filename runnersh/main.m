//
//  main.m
//  runnersh
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSEvalCommand.h"
#import "HelloSailorCommand.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSDictionary *cmds = @{
                                   @"eval": [JSEvalCommand new],
                                   @"hello": [HelloSailorCommand new],
                                   };
        for (int i = 2; i < argc; i++) {
            [cmds[@(argv[1])] setInput:@(argv[i])];
            [cmds[@(argv[1])] execute];
            printf("%d: %s → %s\n", i, argv[i], [[cmds[@(argv[1])] output] UTF8String]);
        }

    }
    return 0;
}

