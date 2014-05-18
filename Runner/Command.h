//
//  Command.h
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Command : NSObject

@property (readwrite, copy) NSString *input;
@property (readonly, copy) NSString *output;
@property (readonly, nonatomic) NSString *name;

- (void) execute;

@end
