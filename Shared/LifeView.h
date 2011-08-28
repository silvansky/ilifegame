//
//  LifeView.h
//  LifeGame
//
//  Created by Valentine Gorshkov on 28.08.11.
//  Copyright 2011 Avos'ka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeViewDelegate.h"


@interface LifeView : UIView {
	int ** f;
	int w;
	int h;
	id<LifeViewDelegate> delegate;
}

@property (nonatomic, retain) id<LifeViewDelegate> delegate;

- (void)updateViewWithField: (int **) field Width: (int) width Height: (int) height;

@end
