//
//  Shape.m
//  Animations
//
//  Created by Philip Liao on 1/2/14.
//  Copyright (c) 2014 Philip Liao. All rights reserved.
//

#import "Shape.h"

@implementation Shape

- (id)initWithFrame:(CGRect)frame andAnimation:(AnimationType) animation
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _animationType = animation;
        _isPressed = false;
    }
    return self;
}

- (void) standardWiggle
{
    [self wiggle:3 withOffset:10 andDuration:0.3];
}

- (void) wiggle: (int) numberOfWiggles withOffset: (int) offset andDuration: (float) duration
{
    CGPoint originalPosition  = self.layer.position;
    
    
    // create a CGPath that implements two arcs (a bounce)
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath,NULL,originalPosition.x,originalPosition.y);
    CGPoint point1 = CGPointMake(originalPosition.x + offset, originalPosition.y);
    CGPoint point2 = CGPointMake(originalPosition.x - offset, originalPosition.y);
    for (int k = 0; k < numberOfWiggles; k++) {
        CGPathAddLineToPoint (thePath, NULL, point1.x, point1.y);
        CGPathAddLineToPoint (thePath, NULL, point2.x, point2.y);
    }
    CGPathAddLineToPoint (thePath, NULL, originalPosition.x, originalPosition.y);

    CAKeyframeAnimation * theAnimation;
    
    // Create the animation object, specifying the position property as the key path.
    theAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    theAnimation.path=thePath;
    theAnimation.duration= duration;
    
    // Add the animation to the layer.
    [self.layer addAnimation:theAnimation forKey:@"position"];

}

- (void) standardShrink
{
    [self resize:0.5 withDuration:1];
}

- (void) standardEnlarge
{
    [self resize:2.0 withDuration:0.01];

}

- (void) resize: (float) targetRatio withDuration: (float) duration
{
    /*
    CABasicAnimation *shrinkAnimation;
    shrinkAnimation = [CABasicAnimation animationWithKeyPath:@"transform"]; //use transform instead of bounds.size
    shrinkAnimation.repeatCount = 1;
    shrinkAnimation.autoreverses = NO;
    shrinkAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    shrinkAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(self.layer.transform, 0.1, 0.1, 1.0)];
    
    
    aniGroupOFF = [[CAAnimationGroup animation] retain];
    aniGroupOFF.delegate = self;
    aniGroupOFF.duration = ANI_DURATION;
    aniGroupOFF.animations = [NSArray arrayWithObjects:shrinkAnimation, nil];
    */
    
    
    CGRect originalBounds = self.layer.bounds;
    CABasicAnimation* buttonPressAnim = [CABasicAnimation animationWithKeyPath:@"bounds"];
    buttonPressAnim.fromValue = [NSNumber numberWithFloat:1.0];
    buttonPressAnim.toValue = [NSNumber numberWithFloat:targetRatio];
    buttonPressAnim.duration = duration;
    [self.layer addAnimation:buttonPressAnim forKey:@"bounds"];
    
    
    self.layer.bounds = CGRectMake(self.layer.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width*targetRatio, self.bounds.size.height*targetRatio);
    
    

    //transform.scale worked
     
    
    
    // Change the actual data value in the layer to the final value.
    //self.layer.opacity = 0.0;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];
    //if ([allTouches count] == 1)
    //{
    for (UITouch *touch in allTouches)
    {
        CGPoint location = [touch locationInView:[self superview]];
        if (CGRectContainsPoint(self.frame, location))
        {
            _isPressed = true;
            
            if (_animationType == kWiggle ){
                [self standardWiggle];
            }
            else if (_animationType == kShrink ) {
                [self standardShrink];
            }
            
        }
    }
    
    //}
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    NSSet *allTouches = [event allTouches];
    //if ([allTouches count] == 1)
    //{
    for (UITouch *touch in allTouches)
    {
        CGPoint location = [touch locationInView:[self superview]];
        if (CGRectContainsPoint(self.frame, location))
        {
            if (_animationType == kWiggle ){
                _isPressed = false;
            }
            else if (_animationType == kShrink ) {
                if (_isPressed) {
                    [self standardEnlarge];
                    _isPressed = false;
                }
            }
            
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSSet *allTouches = [event allTouches];
    
    for (UITouch *touch in allTouches)
    {
        CGPoint location = [touch locationInView:[self superview]];
        if (!CGRectContainsPoint(self.frame, location))
        {
            if (_animationType == kShrink ) {
                if (_isPressed) {
                    [self standardEnlarge];
                    _isPressed = false;
                }
            }
        }
    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
