//
//  DrawHotDog.m
//  BurgerSample
//
//  Created by Parker Lewis on 12/12/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "DrawHotDog.h"

@implementation DrawHotDog

- (void)drawRect:(CGRect)rect {
    
    
    
    float maxX = CGRectGetMaxX(rect);
    float maxY = CGRectGetMaxY(rect);
    

    
    
    // MARK: HOT DOG:
    // Bottom bun
    UIBezierPath *bottomHotDogBun = [[[UIBezierPath alloc] init] autorelease];
    [bottomHotDogBun moveToPoint:CGPointMake(maxX * .25, maxY * .65)];
    [bottomHotDogBun addLineToPoint:CGPointMake(maxX * .75, maxY * .65)];
    [bottomHotDogBun addCurveToPoint:CGPointMake(maxX * .85, maxY * .5) controlPoint1:CGPointMake(maxX * .80, maxY * .65) controlPoint2:CGPointMake(maxX * .85, maxY * .6)];
    [bottomHotDogBun addLineToPoint:CGPointMake(maxX * .15, maxY * .5)];
    [bottomHotDogBun addCurveToPoint:CGPointMake(maxX * .25, maxY * .65) controlPoint1:CGPointMake(maxX * .15, maxY * .6) controlPoint2:CGPointMake(maxX * .2, maxY * .65)];
    bottomHotDogBun.lineWidth = 3;
    [[UIColor orangeColor] setFill];
    [[UIColor blackColor] setStroke];
    [bottomHotDogBun fill];
    [bottomHotDogBun stroke];
    
    // Hot dog
    UIBezierPath *hotDog = [[[UIBezierPath alloc] init] autorelease];
    [hotDog moveToPoint:CGPointMake(maxX * .15, maxY * .5)];
    [hotDog addLineToPoint:CGPointMake(maxX * .85, maxY * .5)];
    [hotDog addCurveToPoint:CGPointMake(maxX * .9, maxY * .45) controlPoint1:CGPointMake(maxX * .875, maxY * .5) controlPoint2:CGPointMake(maxX * .9, maxY * .475)];
    [hotDog addCurveToPoint:CGPointMake(maxX * .85, maxY * .4) controlPoint1:CGPointMake(maxX * .9, maxY * .425) controlPoint2:CGPointMake(maxX * .875, maxY * .4)];
    [hotDog addLineToPoint:CGPointMake(maxX * .15, maxY * .4)];
    [hotDog addCurveToPoint:CGPointMake(maxX * .1, maxY * .45) controlPoint1:CGPointMake(maxX * .125, maxY * .4) controlPoint2:CGPointMake(maxX * .1, maxY * .425)];
    [hotDog addCurveToPoint:CGPointMake(maxX * .15, maxY * .5) controlPoint1:CGPointMake(maxX * .1, maxY * .475) controlPoint2:CGPointMake(maxX * .125, maxY * .5)];
    hotDog.lineWidth = 3;
    [[UIColor brownColor] setFill];
    [[UIColor blackColor] setStroke];
    [hotDog fill];
    [hotDog stroke];
    
    // Top bun
    UIBezierPath *topHotDogBun = [[[UIBezierPath alloc] init] autorelease];
    [topHotDogBun moveToPoint:CGPointMake(maxX * .85, maxY * .4)];
    [topHotDogBun addLineToPoint:CGPointMake(maxX * .15, maxY * .4)];
    [topHotDogBun addCurveToPoint:CGPointMake(maxX * .25, maxY * .3) controlPoint1:CGPointMake(maxX * .15, maxY * .35) controlPoint2:CGPointMake(maxX * .2, maxY * .3)];
    [topHotDogBun addLineToPoint:CGPointMake(maxX * .75, maxY * .3)];
    [topHotDogBun addCurveToPoint:CGPointMake(maxX * .85, maxY * .4) controlPoint1:CGPointMake(maxX * .8, maxY * .3) controlPoint2:CGPointMake(maxX * .85, maxY * .35)];
    topHotDogBun.lineWidth = 3;
    [[UIColor orangeColor] setFill];
    [[UIColor blackColor] setStroke];
    [topHotDogBun fill];
    [topHotDogBun stroke];
    
    // Ketchup
    UIBezierPath *ketchup = [[[UIBezierPath alloc] init] autorelease];
    [ketchup moveToPoint:CGPointMake(maxX * .15, maxY * .475)];
    [ketchup addCurveToPoint:CGPointMake(maxX * .3, maxY * .475) controlPoint1:CGPointMake(maxX * .175, maxY * .45) controlPoint2:CGPointMake(maxX * .225, maxY * .45)];
    [ketchup addCurveToPoint:CGPointMake(maxX * .5, maxY * .475) controlPoint1:CGPointMake(maxX * .375, maxY * .5) controlPoint2:CGPointMake(maxX * .425, maxY * .5)];
    [ketchup addCurveToPoint:CGPointMake(maxX * .7, maxY * .475) controlPoint1:CGPointMake(maxX * .575, maxY * .45) controlPoint2:CGPointMake(maxX * .625, maxY * .45)];
    [ketchup addCurveToPoint:CGPointMake(maxX * .85, maxY * .475) controlPoint1:CGPointMake(maxX * .775, maxY * .5) controlPoint2:CGPointMake(maxX * .825, maxY * .5)];
    ketchup.lineWidth = 2;
    [[UIColor redColor] setStroke];
    [ketchup stroke];
    
    // Mustard
    UIBezierPath *mustard = [[[UIBezierPath alloc] init] autorelease];
    [mustard moveToPoint:CGPointMake(maxX * .15, maxY * .45)];
    [mustard addCurveToPoint:CGPointMake(maxX * .3, maxY * .45) controlPoint1:CGPointMake(maxX * .175, maxY * .425) controlPoint2:CGPointMake(maxX * .225, maxY * .425)];
    [mustard addCurveToPoint:CGPointMake(maxX * .5, maxY * .45) controlPoint1:CGPointMake(maxX * .375, maxY * .475) controlPoint2:CGPointMake(maxX * .425, maxY * .475)];
    [mustard addCurveToPoint:CGPointMake(maxX * .7, maxY * .45) controlPoint1:CGPointMake(maxX * .575, maxY * .425) controlPoint2:CGPointMake(maxX * .625, maxY * .425)];
    [mustard addCurveToPoint:CGPointMake(maxX * .85, maxY * .45) controlPoint1:CGPointMake(maxX * .775, maxY * .475) controlPoint2:CGPointMake(maxX * .825, maxY * .475)];
    mustard.lineWidth = 2;
    [[UIColor yellowColor] setStroke];
    [mustard stroke];
}

@end
