    //
//  SampleViewController.m
//  PageScrollSample
//
//  Created by taiki on 11/07/12.
//  Copyright 2011 http://twitter.com/yashigani. All rights reserved.
//

#import "SampleViewController.h"

#define SPACE_WIDTH 20
#define CONTENT_NUM 5

//#define REVEALS 1


@interface CustomView : UIView
{
    UIColor *color;
}
@property (nonatomic, retain) UIColor *color;

@end
@implementation CustomView
@synthesize color;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        CGFloat r = (rand()%255) / 255.0;
        CGFloat g = (rand()%255) / 255.0;
        CGFloat b = (rand()%255) / 255.0;
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
}

- (void)dealloc
{
    [color release]; color = nil;
    [super dealloc];
}
@end

@implementation SampleViewController
@synthesize scrollView = scrollView_;


- (void)loadView
{
    UIView *v = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
    self.view = v;
    v.backgroundColor = [UIColor grayColor];

    CGRect frame = CGRectMake(SPACE_WIDTH * 1.5, 0, v.frame.size.width - SPACE_WIDTH * 3, 460);
    self.scrollView = [[[UIScrollView alloc] initWithFrame:frame] autorelease];
    self.scrollView.clipsToBounds = NO;
    self.scrollView.pagingEnabled = YES;
#ifdef REVEALS
    self.scrollView.backgroundColor = [UIColor blackColor];
#endif
    [self.view addSubview:self.scrollView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSInteger contentWidth = self.scrollView.frame.size.width - SPACE_WIDTH;
    for (int i = 0; i < CONTENT_NUM; ++i) {
        CGRect frame = CGRectMake((contentWidth + SPACE_WIDTH) * i + SPACE_WIDTH / 2, 0, contentWidth, 460);
        CustomView *v = [[CustomView alloc] initWithFrame:frame];
        [self.scrollView addSubview:v];
        [v release];
    }
    self.scrollView.contentSize = CGSizeMake((contentWidth + SPACE_WIDTH) * CONTENT_NUM, 460);
}

- (void)dealloc
{
    [scrollView_ release]; scrollView_ = nil;
    [super dealloc];
}

@end
