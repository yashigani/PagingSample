//
//  DummyView.m
//  PageScrollSample
//
//  Created by yashigani on 7/12/11.
//  Copyright 2011 http://twitter.com/yashigani. All rights reserved.
//

#import "DummyView.h"


@implementation DummyView
@synthesize color;
@synthesize title;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        CGFloat r = (arc4random() % 255) / 255.0;
        CGFloat g = (arc4random() % 255) / 255.0;
        CGFloat b = (arc4random() % 255) / 255.0;
        self.color = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    [color set];
    CGContextFillRect(context, rect);
    [[UIColor whiteColor] set];
    CGContextSetLineWidth(context, 5);
    CGContextStrokeRect(context, rect);

    if (title) {
        [[UIColor blackColor] set];
        UIFont *f = [UIFont systemFontOfSize:20];

        CGSize s = [title sizeWithFont:f];
        NSInteger x = round((rect.size.width - s.width) / 2);
        NSInteger y = round((rect.size.height - s.height) / 2);
        CGPoint p = CGPointMake(x, y);

        [title drawAtPoint:p withFont:f];
    }

}

- (void)dealloc
{
    [color release]; color = nil;
    [super dealloc];
}
@end
