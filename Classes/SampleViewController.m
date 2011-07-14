    //
//  SampleViewController.m
//  PageScrollSample
//
//  Created by taiki on 11/07/12.
//  Copyright 2011 http://twitter.com/yashigani. All rights reserved.
//

#import "SampleViewController.h"
#import "DummyView.h"

#define SPACE_WIDTH 20
#define CONTENT_NUM 5

//#define REVEALS 1


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
        DummyView *v = [[DummyView alloc] initWithFrame:frame];
        v.title = [NSString stringWithFormat:@"View%d", i + 1];
        v.color = nil;
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
