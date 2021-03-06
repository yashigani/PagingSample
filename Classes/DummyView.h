//
//  DummyView.h
//  PageScrollSample
//
//  Created by yashigani on 7/12/11.
//  Copyright 2011 http://twitter.com/yashigani. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DummyView : UIView
{
    UIColor *color;
    NSString *title;

    BOOL drawWhiteRect;
}
@property (nonatomic, retain) UIColor *color;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign, getter=isDrawWhiteRect) BOOL drawWhiteRect;

@end
