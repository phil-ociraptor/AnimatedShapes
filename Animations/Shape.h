//
//  Shape.h
//  Animations
//
//  Created by Philip Liao on 1/2/14.
//  Copyright (c) 2014 Philip Liao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Shape : UIView

typedef enum {
    kWiggle,
    kShrink
} AnimationType;

@property AnimationType animationType;
@property BOOL isPressed;

- (id)initWithFrame:(CGRect)frame andAnimation:(AnimationType) animation;
- (void) standardWiggle;
- (void) wiggle: (int) numberOfWiggles withOffset: (int) offset andDuration: (float) duration;
- (void) standardShrink;
- (void) standardEnlarge;
- (void) resize: (float) targetRatio withDuration: (float) duration;

@end
