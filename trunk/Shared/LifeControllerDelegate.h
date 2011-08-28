//
//  LifeControllerDelegate.h
//  LifeGame
//
//  Created by Valentine Gorshkov on 12.06.11.
//  Copyright 2011 Avos'ka. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LifeControllerDelegate
- (void)updateField: (int **) field;
@end
