//
//  BluetoothTestCommand.h
//  Runner
//
//  Created by Doug DeJulio on 2014-05-28.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "Command.h"

@interface BluetoothTestCommand : Command <CBCentralManagerDelegate>

@property CBCentralManager *btmanager;

@end
