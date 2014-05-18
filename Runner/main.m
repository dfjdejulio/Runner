//
//  main.m
//  runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelloSailorCommand.h"

int main(int argc, const char * argv[])
{
    int i;

    @autoreleasepool {
        Command *cmd = [HelloSailorCommand new];
        for (i = 1; i < argc; i++) {
            cmd.input = @(argv[i]);
            [cmd execute];
            printf("%d: %s → %s\n", i, argv[i], cmd.output.UTF8String);
        }

    }
    return 0;
}

