//
//  AppDelegate_iPhone.h
//  LifeGame
//
//  Created by Valentine Gorshkov on 11.06.11.
//  Copyright 2011 Avos'ka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeView.h"

@interface AppDelegate_iPhone : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	LifeView *view;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LifeView *view;

@end

