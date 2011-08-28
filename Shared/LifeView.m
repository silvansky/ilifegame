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
	CGFloat cellHeight = myFrame.size.width / (float)h;
	for (int i = 0; i < w; i++) {
		for (int j = 0; j < h; j++) {
			CGRect cellRect = CGRectMake(i * cellWidth, j * cellHeight, cellWidth, cellHeight);
			if (f[i][j]) {
				// draw rect
				UIRectFill(cellRect);
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
}

@end
