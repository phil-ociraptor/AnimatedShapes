//
//  MainViewController.m
//  Animations
//
//  Created by Philip Liao on 1/2/14.
//  Copyright (c) 2014 Philip Liao. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];

        
        _shape1 = [[Shape alloc] initWithFrame:CGRectMake(0, 0, 100, 50) andAnimation:kWiggle];
        _shape1.center = CGPointMake(160, 100);
        _shape1.backgroundColor = [UIColor colorWithRed:79.0/256.0 green:54.0/256.0 blue:74.0/256.0 alpha:1];
        
        [self.view addSubview:_shape1];

        _shape2 = [[Shape alloc] initWithFrame:CGRectMake(0, 0, 100, 50) andAnimation:kShrink];
        _shape2.center = CGPointMake(160, 250);
        _shape2.backgroundColor = [UIColor colorWithRed:79.0/256.0 green:54.0/256.0 blue:74.0/256.0 alpha:1];
        
        [self.view addSubview:_shape2];
        
        _shape3 = [[Shape alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        _shape3.center = CGPointMake(160, 400);
        _shape3.backgroundColor = [UIColor colorWithRed:79.0/256.0 green:54.0/256.0 blue:74.0/256.0 alpha:1];
        
        [self.view addSubview:_shape3];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

/*

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];
    //if ([allTouches count] == 1)
    //{
    for (UITouch *touch in allTouches)
    {
        CGPoint location = [touch locationInView:self.view];
        if (CGRectContainsPoint(_shape1.frame, location))
        {
            [_shape1 standardWiggle];
        } else if (CGRectContainsPoint(_shape2.frame, location))
        {
            [_shape2 standardShrink];
        }
    }
    
    //}
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];

    for (UITouch *touch in allTouches)
    {
        CGPoint location = [touch locationInView:self.view];
        if (CGRectContainsPoint(_shape1.frame, location))
        {
            //do nothing, for now
        } else if (CGRectContainsPoint(_shape2.frame, location))
        {
            [_shape2 standardEnlarge];
        }
    }
}

 */

 

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
