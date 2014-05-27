//
//  Command.h
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <Foundation/Foundation.h>

/**

 This is the base for all "Command" objects.
 
 */

@interface Command : NSObject {
    @protected NSString *output;
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
