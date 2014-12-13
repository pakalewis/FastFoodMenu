//
//  DrawPizza.m
//  BurgerSample
//
//  Created by Parker Lewis on 12/12/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "DrawPizza.h"

@implementation DrawPizza


- (void)drawRect:(CGRect)rect {
    
    
    float maxX = CGRectGetMaxX(rect);
    float maxY = CGRectGetMaxY(rect);
    
 
    
    // MARK: PIZZA
    // Crust
    UIBezierPath *crust = [[[UIBezierPath alloc] init] autorelease];
    [crust moveToPoint:CGPointMake(maxX * .2, maxY * .35)];
    [crust addCurveToPoint:CGPointMake(maxX * .1, maxY * .3) controlPoint1:CGPointMake(maxX * .125, maxY * .35) controlPoint2:CGPointMake(maxX * .1, maxY * .325)];
    [crust addCurveToPoint:CGPointMake(maxX * .5, maxY * .175) controlPoint1:CGPointMake(maxX * .1, maxY * .225) controlPoint2:CGPointMake(maxX * .2, maxY * .175)];
    [crust addCurveToPoint:CGPointMake(maxX * .9, maxY * .3) controlPoint1:CGPointMake(maxX * .8, maxY * .175) controlPoint2:CGPointMake(maxX * .9, maxY * .225)];
    [crust addCurveToPoint:CGPointMake(maxX * .8, maxY * .35) controlPoint1:CGPointMake(maxX * .9, maxY * .325) controlPoint2:CGPointMake(maxX * .875, maxY * .35)];
    [crust addLineToPoint:CGPointMake(maxX * .2, maxY * .35)];
    crust.lineWidth = 3;
    [[UIColor orangeColor] setFill];
    [[UIColor blackColor] setStroke];
    [crust fill];
    [crust stroke];
    
    // Cheese
    UIBezierPath *pizzaCheese = [[[UIBezierPath alloc] init] autorelease];
    [pizzaCheese moveToPoint:CGPointMake(maxX * .2, maxY * .35)];
    [pizzaCheese addLineToPoint:CGPointMake(maxX * .8, maxY * .35)];
    [pizzaCheese addLineToPoint:CGPointMake(maxX * .5, maxY * .9)];
    [pizzaCheese addLineToPoint:CGPointMake(maxX * .2, maxY * .35)];
    pizzaCheese.lineWidth = 3;
    [[UIColor yellowColor] setFill];
    [[UIColor blackColor] setStroke];
    [pizzaCheese fill];
    [pizzaCheese stroke];
    
    // Pepperoni
    UIBezierPath *pepperoni = [[[UIBezierPath alloc] init] autorelease];
    [pepperoni moveToPoint:CGPointMake(maxX * .4, maxY * .5)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .45, maxY * .55) controlPoint1:CGPointMake(maxX * .425, maxY * .5) controlPoint2:CGPointMake(maxX * .45, maxY * .525)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .4, maxY * .6) controlPoint1:CGPointMake(maxX * .45, maxY * .575) controlPoint2:CGPointMake(maxX * .425, maxY * .6)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .35, maxY * .55) controlPoint1:CGPointMake(maxX * .375, maxY * .6) controlPoint2:CGPointMake(maxX * .35, maxY * .575)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .4, maxY * .5) controlPoint1:CGPointMake(maxX * .35, maxY * .525) controlPoint2:CGPointMake(maxX * .375, maxY * .5)];
    
    [pepperoni moveToPoint:CGPointMake(maxX * .45, maxY * .4)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .5, maxY * .45) controlPoint1:CGPointMake(maxX * .475, maxY * .4) controlPoint2:CGPointMake(maxX * .5, maxY * .425)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .45, maxY * .5) controlPoint1:CGPointMake(maxX * .5, maxY * .475) controlPoint2:CGPointMake(maxX * .475, maxY * .5)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .4, maxY * .45) controlPoint1:CGPointMake(maxX * .425, maxY * .5) controlPoint2:CGPointMake(maxX * .4, maxY * .475)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .45, maxY * .4) controlPoint1:CGPointMake(maxX * .4, maxY * .425) controlPoint2:CGPointMake(maxX * .425, maxY * .4)];
    
    [pepperoni moveToPoint:CGPointMake(maxX * .6, maxY * .45)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .65, maxY * .5) controlPoint1:CGPointMake(maxX * .625, maxY * .45) controlPoint2:CGPointMake(maxX * .65, maxY * .475)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .6, maxY * .55) controlPoint1:CGPointMake(maxX * .65, maxY * .525) controlPoint2:CGPointMake(maxX * .625, maxY * .55)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .55, maxY * .5) controlPoint1:CGPointMake(maxX * .575, maxY * .55) controlPoint2:CGPointMake(maxX * .55, maxY * .525)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .6, maxY * .45) controlPoint1:CGPointMake(maxX * .55, maxY * .475) controlPoint2:CGPointMake(maxX * .575, maxY * .45)];
    
    [pepperoni moveToPoint:CGPointMake(maxX * .5, maxY * .65)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .55, maxY * .7) controlPoint1:CGPointMake(maxX * .525, maxY * .65) controlPoint2:CGPointMake(maxX * .55, maxY * .675)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .5, maxY * .75) controlPoint1:CGPointMake(maxX * .55, maxY * .725) controlPoint2:CGPointMake(maxX * .525, maxY * .75)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .45, maxY * .7) controlPoint1:CGPointMake(maxX * .475, maxY * .75) controlPoint2:CGPointMake(maxX * .45, maxY * .725)];
    [pepperoni addCurveToPoint:CGPointMake(maxX * .5, maxY * .65) controlPoint1:CGPointMake(maxX * .45, maxY * .675) controlPoint2:CGPointMake(maxX * .475, maxY * .65)];
    
    pepperoni.lineWidth = 1;
    [[UIColor redColor] setFill];
    [[UIColor blackColor] setStroke];
    [pepperoni fill];
    [pepperoni stroke];
    
    
    
}

@end
