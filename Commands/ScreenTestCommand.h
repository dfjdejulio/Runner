//
//  ScreenTestCommand.h
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "Command.h"
#import <UIKit/UIKit.h>
#import <ExternalAccessory/ExternalAccessory.h>

/**
 
 This is an iOS-only command that probes for information on currently-attached
 screens, used for debugging apps that use external displays or AirPlay
 mirroring.
 
 */

@interface ScreenTestCommand : Command {
	EAAccessoryManager *accessoryManager;
}

@end
