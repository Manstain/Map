//
//  myAppDelegate.m
//  Earthquake
//
//  Created by Pavel on 1/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "myAppDelegate.h"

#import "RootController.h"

@implementation myAppDelegate

@synthesize window = _window;
@synthesize rootController;


- (void)dealloc
{
    [_window release];
    [RootController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.RootController = [[[RootController alloc] initWithNibName:@"RootController" bundle:nil] autorelease];
    self.window.rootViewController = self.rootController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
