//
//  AppDelegate_iPad.m
//  LifeGame
//
//  Created by Valentine Gorshkov on 11.06.11.
//  Copyright 2011 Avos'ka. All rights reserved.
//

#import "AppDelegate_iPad.h"

@implementation AppDelegate_iPad

@synthesize window, toolbar, lifeView, slider;
@synthesize btnStart, btnStop, btnClear, btnGeneration;


#pragma mark -
#pragma mark Application lifecycle

- (void)resetTimerWithInterval:(CGFloat)interval {
	[_timer invalidate];
	_timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

	btnStart.target = self;
	btnStart.action = @selector(start);

	btnStop.target = self;
	btnStop.action = @selector(stop);
	[btnStop setEnabled:NO];

	btnClear.target = self;
	btnClear.action = @selector(clear);
	[btnClear setEnabled:YES];
	
	CGRect rect = self.window.bounds;
	
	int fWidth = rect.size.width;
	int fHeight = rect.size.height - toolbar.bounds.size.height;
	int w = fWidth / 26 + 1;
	int h = fHeight / 26 + 1;
	
	started = NO;
	
	lifeView.delegate = self;

	lifeController = [[LifeController alloc] initWithWidth: w Height: h];
	lifeController.delegate = self;
	[self.window makeKeyAndVisible];
	[lifeController step];
	
	[self resetTimerWithInterval:1.05 - slider.value];
    
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
	[lifeController dealloc];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [super dealloc];
}


- (void)updateField: (int **) field {
	[lifeView updateViewWithField:field Width:lifeController.width Height:lifeController.height];
}

- (void)cellClickedAtX: (int)x Y: (int)y {
	if (!started)
		[lifeController setLifeAtCellWithX:x Y:y];
}

- (void)onTimer: (NSTimer *) timer {
	if (started)
	{
		[btnGeneration setTitle:[NSString stringWithFormat:@"Generation: %d", gen]];
		[lifeController step];
		gen++;
	}
}

- (void)start {
	NSLog(@"start!");
	started = YES;
	[btnStop setEnabled:YES];
	[btnStart setEnabled:NO];
	[btnClear setEnabled:NO];
}

- (void)stop {
	NSLog(@"stop!");
	started = NO;
	[btnStop setEnabled:NO];
	[btnStart setEnabled:YES];
	[btnClear setEnabled:YES];
}

- (void)clear {
	NSLog(@"clear!");
	gen = 0;
	[btnGeneration setTitle:[NSString stringWithFormat:@"Generation: %d", gen]];
	[lifeController clearField];
}

- (IBAction)sliderValueChanged:(id)sender {
	if (sender == slider) {
		[self resetTimerWithInterval:1.05 - slider.value];
	}
}

@end
