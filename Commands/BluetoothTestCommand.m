//
//  BluetoothTestCommand.m
//  Runner
//
//  Created by Doug DeJulio on 2014-05-28.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "BluetoothTestCommand.h"

@implementation BluetoothTestCommand

- (BluetoothTestCommand *)init
{
    self = [super init];
    name = @"BTTest";
    self.btmanager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:nil];
    return self;
}

- (void) centralManagerDidUpdateState:(CBCentralManager *)central
{
    ;
}

@end
