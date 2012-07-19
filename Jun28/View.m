//
//  View.m
//  Jun28
//
//  Created by Dan Ristea on 6/28/12.
//  Copyright (c) 2012 NBS. All rights reserved.
//

#import "View.h"
#import "LittleView.h"

@implementation View




- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
		
        //Trailing blank to avoid cutting off last letter
        //because italic leans to the right.
        NSString *text = @"TOP GUN";
		
        CGRect b = self.bounds;
        UIFont *font = [UIFont italicSystemFontOfSize: b.size.height];
        CGSize size = [text sizeWithFont: font];
		
        CGRect f = CGRectMake(
							  b.size.width,
							  0,
							  size.width,
							  size.height
							  );
		
        label = [[UILabel alloc] initWithFrame: f];
        label.font = font;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = text;
        [self addSubview: label];
		
		CGRect ff = CGRectMake(0, 0, 80, 40);
        littleView = [[LittleView alloc] initWithFrame: ff];
        [self addSubview: littleView];
    }
    return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView: self];
        littleView.center = point;	//Move the littleView to a new location.
		
        //Can combine the above three statements to
        //littleView.center = [[touches anyObject] locationInView: self];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{
	
	// Drawing code
	CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	//CGContextRef c = UIGraphicsGetCurrentContext();

    [UIView animateWithDuration: 25
						  delay: 23.75
						options: UIViewAnimationOptionCurveLinear
					 animations: ^{
						 //Move the label far enough to the left
						 //so that it's out of the View.
						 label.center = CGPointMake(
													-label.bounds.size.width / 2,
													self.bounds.size.height / 2
													);
					 }
					 completion: NULL
     ];
	UIImage *image = [UIImage imageNamed: @"wallpaper2.jpg"];	//100 by 100
	if (image == nil) {
		NSLog(@"could not find the image");
		return;
	}
	
	//upper left corner of image
	CGPoint point = CGPointMake(
								(w - image.size.width) / 2,
								h - image.size.height - 20
								);
	
	[image drawAtPoint: point];

}


@end