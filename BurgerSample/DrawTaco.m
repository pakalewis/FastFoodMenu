//
//  DrawTaco.m
//  BurgerSample
//
//  Created by Parker Lewis on 12/12/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "DrawTaco.h"

@implementation DrawTaco


- (void)drawRect:(CGRect)rect {
    
    float maxX = CGRectGetMaxX(rect);
    float maxY = CGRectGetMaxY(rect);
    

    
    // MARK: TACO
    // Meat
    UIBezierPath *taco = [[[UIBezierPath alloc] init] autorelease];
    [taco moveToPoint:CGPointMake(maxX * .2, maxY * .9)];
    [taco addCurveToPoint:CGPointMake(maxX * .1, maxY * .8) controlPoint1:CGPointMake(maxX * .15, maxY * .9) controlPoint2:CGPointMake(maxX * .1, maxY * .85)];
    [taco addCurveToPoint:CGPointMake(maxX * .8, maxY * .6) controlPoint1:CGPointMake(maxX * .2, maxY * .4) controlPoint2:CGPointMake(maxX * .4, maxY * .3)];
    [taco addLineToPoint:CGPointMake(maxX * .2, maxY * .9)];
    taco.lineWidth = 3;
    [[UIColor brownColor] setFill];
    [[UIColor blackColor] setStroke];
    [taco fill];
    [taco stroke];
    
    UIBezierPath *tacoShell = [[[UIBezierPath alloc] init] autorelease];
    [tacoShell moveToPoint:CGPointMake(maxX * .2, maxY * .9)];
    [tacoShell addCurveToPoint:CGPointMake(maxX * .9, maxY * .6) controlPoint1:CGPointMake(maxX * .3, maxY * .4) controlPoint2:CGPointMake(maxX * .5, maxY * .3)];
    [tacoShell addLineToPoint:CGPointMake(maxX * .2, maxY * .9)];
    tacoShell.lineWidth = 3;
    [[UIColor yellowColor] setFill];
    [[UIColor blackColor] setStroke];
    [tacoShell fill];
    [tacoShell stroke];
    
    
    
    
}



@end
