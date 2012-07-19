//
//  LittleView.m
//  Jun28
//
//  Created by Dan Ristea on 6/28/12.
//  Copyright (c) 2012 NBS. All rights reserved.
//

#import "LittleView.h"

@implementation LittleView

- (id) initWithFrame: (CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
    // Drawing code
    //UIFont *font = [UIFont systemFontOfSize: 20];
    //[@"Maverick!" drawAtPoint: CGPointZero withFont: font];
	
	UIImage *image = [UIImage imageNamed: @"plane2.png"];	//100 by 100
	if (image == nil) {
		NSLog(@"could not find the image");
		return;
	}
	
	//upper left corner of image
	
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;

	CGPoint point = CGPointMake(
								(w - image.size.width)/2,
								h - image.size.height
								);
	
	[image drawAtPoint: point];

	
}


@end
