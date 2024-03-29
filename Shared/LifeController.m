//
//  LifeController.m
//  LifeGame
//
//  Created by Valentine Gorshkov on 11.06.11.
//  Copyright 2011 Avos'ka. All rights reserved.
//

#import "LifeController.h"


@implementation LifeController

@synthesize delegate;
@synthesize width = _width, height = _height;

- (void)freeField: (int**)f {
	for (int i = 0; i < _width; i++) {
		free(f[i]);
	}
	free(f);
}

- (void)setField: (int **)newField {
	if (field)
		[self freeField:field];
	field = newField;
}

- (id)initWithWidth: (int)width Height: (int)height {
	_width = width;
	_height = height;
	self = [super init];
	if (self) {
		int ** newField = malloc(sizeof(int) * _width);
		for (int i = 0; i < _width; i++) {
			newField[i] = malloc(sizeof(int) * _height);
			for (int j = 0; j < _height; j++)
				newField[i][j] = 0;
		}
		[self setField: newField];
	}
	return self;
}

- (void)dealloc {
	[self freeField:field];
	[super dealloc];
}

- (void)invertCellWithX: (int)x Y: (int)y {
	field[x][y] = !field[x][y];
	[delegate updateField:field];
}

- (void)setLifeAtCellWithX: (int)x Y: (int)y {
	field[x][y] = 1;
	[delegate updateField:field];
}

- (int)numberOfNeighborsOfX: (int)x Y: (int)y {
/*
 
 +-+-+-+
 |1|2|3|
 +-+-+-+
 |4|x|5|
 +-+-+-+
 |6|7|8|
 +-+-+-+
 
 */
	
	// counting alive ones from eight neighburs
	int n1x, n1y,
		n2x, n2y,
		n3x, n3y,
		n4x, n4y,
		n5x, n5y,
		n6x, n6y,
		n7x, n7y,
		n8x, n8y;
	
	n1x = n4x = n6x = x - 1;
	n2x = n7x = x;
	n3x = n5x = n8x = x + 1;
	
	n1y = n2y = n3y = y - 1;
	n4y = n5y = y;
	n6y = n7y = n8y = y + 1;
	
	if (n1x < 0)
		n1x = _width - 1;
	if (n4x < 0)
		n4x = _width - 1;
	if (n6x < 0)
		n6x = _width - 1;
	
	if (n3x == _width)
		n3x = 0;
	if (n5x == _width)
		n5x = 0;
	if (n8x == _width)
		n8x = 0;
	
	if (n1y < 0)
		n1y = _height - 1;
	if (n2y < 0)
		n2y = _height - 1;
	if (n3y < 0)
		n3y = _height - 1;
	
	if (n6y == _height)
		n6y = 0;
	if (n7y == _height)
		n7y = 0;
	if (n8y == _height)
		n8y = 0;
		
	int n = field[n1x][n1y] + field[n2x][n2y] + field[n3x][n3y] + 
			field[n4x][n4y] + field[n5x][n5y] + 
			field[n6x][n6y] + field[n7x][n7y] + field[n8x][n8y];
	if (x == 0 && y == 0)
		NSLog([NSString stringWithFormat:@"neighbours: %d, coords:\n%d %d | %d %d | %d %d\n%d %d | %d %d | %d %d\n%d %d | %d %d | %d %d",
			   n,
			   n1x, n1y,
			   n2x, n2y,
			   n3x, n3y,
			   n4x, n4y,
			   x, y,
			   n5x, n5y,
			   n6x, n6y,
			   n7x, n7y,
			   n8x, n8y]);
	return n;
}

- (void)step {
	int ** newField = malloc(sizeof(int) * _width);
	for (int i = 0; i < _width; i++) {
		newField[i] = malloc(sizeof(int) * _height);
	}
	for (int i = 0; i < _width; i++) {
		for (int j = 0; j < _height; j++) {
			int n = [self numberOfNeighborsOfX:i Y:j];
			int newCell = field[i][j];
			if (newCell) {
				// checking death condtion
				if (n < 2 || n > 3)
					newCell = 0;
			} else {
				// checking birth condition
				if (n == 3)
					newCell = 1;
			}
			newField[i][j] = newCell;
		}
	}
	[self setField:newField];
	[delegate updateField:field];
}

- (BOOL)lifeAtX: (int)x Y: (int)y {
	return field[x][y];
}

- (void)clearField {
	for (int i = 0; i < _width; i++) {
		for (int j = 0; j < _height; j++) {
			field[i][j] = 0;
		}
	}
	[delegate updateField:field];
}

@end
