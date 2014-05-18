//
//  Command.h
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Command <NSObject>

@property (readwrite, copy) NSString *input;
@property (readonly, copy) NSString *output;

- (void) execute;

@end