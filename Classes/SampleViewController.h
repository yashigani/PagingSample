//
//  SampleViewController.h
//  PageScrollSample
//
//  Created by taiki on 11/07/12.
//  Copyright 2011 http://twitter.com/yashigani. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SampleViewController : UIViewController
<UIScrollViewDelegate>
{
    UIScrollView *scrollView_;
}
@property (nonatomic, retain) UIScrollView *scrollView;

@end
