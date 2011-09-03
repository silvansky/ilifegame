//
//  LifeView.m
//  LifeGame
//
//  Created by Valentine Gorshkov on 28.08.11.
//  Copyright 2011 Avos'ka. All rights reserved.
//

#import "LifeView.h"


@implementation LifeView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
		f = 0;
		w = 0;
		h = 0;
		[self setMultipleTouchEnabled:YES];
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)drawRect:(CGRect)rect {
	CGRect myFrame = self.bounds;
	[[UIColor whiteColor] set];
	UIRectFill(myFrame);
	[[UIColor blackColor] set];
	UIRectFrame(myFrame);
	CGFloat cellWidth = myFrame.size.width / (float)w;
	CGFloat cellHeight = myFrame.size.height / (float)h;
	for (int i = 0; i < w; i++) {
		for (int j = 0; j < h; j++) {
			CGRect cellRect = CGRectMake(i * cellWidth, j * cellHeight, cellWidth, cellHeight);
			if (f[i][j]) {
				// draw rect
				[[UIColor redColor] set];
				UIRectFill(cellRect);
				[[UIColor blackColor] set];
				UIRectFrame(cellRect);
			} else {
				// draw frame
				UIRectFrame(cellRect);
			}
		}
	}
}

- (void)updateViewWithField: (int **) field Width: (int) width Height: (int) height {
	f = field;
	w = width;
	h = height;
	[self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	for (UITouch * touch in touches) {
		CGPoint p = [touch locationInView:self];
		CGRect myFrame = self.bounds;
		CGFloat cellWidth = myFrame.size.width / (float)w;
		CGFloat cellHeight = myFrame.size.height / (float)h;
		int x = (int)(p.x / cellWidth);
		int y = (int)(p.y / cellHeight);
		[delegate cellClickedAtX:x Y:y];
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	[self touchesBegan:touches withEvent:event];
}

@end
