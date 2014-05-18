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

@interface ScreenTestCommand : Command {
	EAAccessoryManager *accessoryManager;
}

@end
