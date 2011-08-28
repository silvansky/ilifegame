//
//  LifeViewDelegate.h
//  LifeGame
//
//  Created by Valentine Gorshkov on 28.08.11.
//  Copyright 2011 Avos'ka. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LifeViewDelegate
- (void)cellClickedAtX: (int)x Y: (int)y;
@end
