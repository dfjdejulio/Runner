//
//  ScreenTestCommand.m
//  Runner
//
//  Created by Doug DeJulio on 5/18/14.
//  Copyright (c) 2014 AISB. All rights reserved.
//

#import "ScreenTestCommand.h"

@implementation ScreenTestCommand

#pragma mark Life cycle

- (ScreenTestCommand *)init
{
    self = [super init];
    output = [NSMutableString new];
    accessoryManager = EAAccessoryManager.sharedAccessoryManager;
    name = @"ScreenTest";
    return self;
}

#pragma mark Method

- (void)execute
{
	int i;

    NSMutableString *o = (NSMutableString *)output;

	[o setString: @"Device Info:"];
	if ([UIScreen respondsToSelector:@selector(screens)]) {
		[o appendFormat: @"\n\nScreens: %lu", (unsigned long)UIScreen.screens.count];
		i = 1;
		for(UIScreen *thisScreen in UIScreen.screens) {
			[o appendFormat: @"\nScreen %d:", i++];
			[o appendFormat: @"\n  Modes: %lu", (unsigned long)thisScreen.availableModes.count];
			for (UIScreenMode *thisMode in thisScreen.availableModes) {
				[o appendFormat: @"\n    %.0fx%.0f (%.2f:1)", thisMode.size.width, thisMode.size.height, thisMode.pixelAspectRatio];
			}
		}
	} else {
		[o appendString: @"\nCan't have multiple screens."];
	}

	[o appendFormat: @"\n\nAccessories: %lu", (unsigned long)accessoryManager.connectedAccessories.count];

	i=1;
	for (EAAccessory *accessory in accessoryManager.connectedAccessories) {
		[o appendFormat: @"\nAccessory %d", i++];
		[o appendString: @"\n  Name: \""];
		[o appendString: accessory.name];
		[o appendString: @"\" manufacturer \""];
		[o appendString: accessory.manufacturer];
		[o appendString: @"\""];
		if (accessory.connected) {
			[o appendString: @"\n  Connected!"];
		} else {
			[o appendString: @"\n  Not connected."];
		}
	}
}

@end
