//
//  LifeController.h
//  LifeGame
//
//  Created by Valentine Gorshkov on 11.06.11.
//  Copyright 2011 Avos'ka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LifeControllerDelegate.h"


@interface LifeController : NSObject {
	int ** field;
	int _width;
	int _height;
	id <LifeControllerDelegate> delegate;
}

@property (nonatomic, assign) id <LifeControllerDelegate> delegate;
@property (nonatomic, assign, readonly) int width;
@property (nonatomic, assign, readonly) int height;

- (id)initWithWidth: (int)width Height: (int)height;
- (void)invertCellWithX: (int)x Y: (int)y;
- (void)setLifeAtCellWithX: (int)x Y: (int)y;
- (void)step;
- (BOOL)lifeAtX: (int)x Y: (int)y;
- (void)clearField;

@end
