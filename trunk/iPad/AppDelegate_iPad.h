//
//  AppDelegate_iPad.h
//  LifeGame
//
//  Created by Valentine Gorshkov on 11.06.11.
//  Copyright 2011 Avos'ka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Shared/LifeControllerDelegate.h"
#import "../Shared/LifeController.h"
#import "LifeViewDelegate.h"
#import "../Shared/LifeView.h"

@interface AppDelegate_iPad : NSObject <UIApplicationDelegate, LifeControllerDelegate, LifeViewDelegate> {
	UIWindow *window;
	UIBarButtonItem *btnStart;
	UIBarButtonItem *btnStop;
	UIBarButtonItem *btnClear;
	UIBarButtonItem *btnGeneration;
	UIToolbar *toolbar;
	LifeController *lifeController;
	LifeView *lifeView;
	NSTimer *_timer;
	int gen;
	BOOL started;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *btnStart;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *btnStop;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *btnClear;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *btnGeneration;
@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet LifeView *lifeView;

- (void)updateField: (int **) field;
- (void)cellClickedAtX: (int)x Y: (int)y;
- (void)onTimer: (NSTimer *) timer;
- (void)start;
- (void)stop;
- (void)clear;

@end
