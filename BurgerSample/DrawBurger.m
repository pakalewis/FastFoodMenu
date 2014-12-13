//
//  DrawBurger.m
//  BurgerSample
//
//  Created by Parker Lewis on 12/12/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "DrawBurger.h"

@implementation DrawBurger

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {

    float maxX = CGRectGetMaxX(rect);
    float maxY = CGRectGetMaxY(rect);
    
    
    
    // Bottom bun
    UIBezierPath *bottomBun = [[[UIBezierPath alloc] init] autorelease];
    [bottomBun moveToPoint:CGPointMake(maxX * .1, maxY * .7)];
    [bottomBun addLineToPoint:CGPointMake(maxX * .9, maxY * .7)];
    [bottomBun addCurveToPoint:CGPointMake(maxX * .85, maxY * .8) controlPoint1:CGPointMake(maxX * .9, maxY * .775) controlPoint2:CGPointMake(maxX * .875, maxY * .8)];
    [bottomBun addLineToPoint:CGPointMake(maxX * .15, maxY * .8)];
    [bottomBun addCurveToPoint:CGPointMake(maxX * .1, maxY * .7) controlPoint1:CGPointMake(maxX * .125, maxY * .8) controlPoint2:CGPointMake(maxX * .1, maxY * .725)];
    bottomBun.lineWidth = 3;
    [[UIColor orangeColor] setFill];
    [[UIColor blackColor] setStroke];
    [bottomBun fill];
    [bottomBun stroke];
    
    // Meat patty
    UIBezierPath *meatPatty = [[[UIBezierPath alloc] init] autorelease];
    [meatPatty moveToPoint:CGPointMake(maxX * .15, maxY * .7)];
    [meatPatty addLineToPoint:CGPointMake(maxX * .15, maxY * .6)];
    [meatPatty addLineToPoint:CGPointMake(maxX * .85, maxY * .6)];
    [meatPatty addLineToPoint:CGPointMake(maxX * .85, maxY * .7)];
    [meatPatty addLineToPoint:CGPointMake(maxX * .15, maxY * .7)];
    meatPatty.lineWidth = 3;
    [[UIColor brownColor] setFill];
    [[UIColor blackColor] setStroke];
    [meatPatty fill];
    [meatPatty stroke];
    
    // Tomato
    UIBezierPath *tomato = [[[UIBezierPath alloc] init] autorelease];
    [tomato moveToPoint:CGPointMake(maxX * .175, maxY * .6)];
    [tomato addLineToPoint:CGPointMake(maxX * .175, maxY * .5)];
    [tomato addLineToPoint:CGPointMake(maxX * .825, maxY * .5)];
    [tomato addLineToPoint:CGPointMake(maxX * .825, maxY * .6)];
    [tomato addLineToPoint:CGPointMake(maxX * .175, maxY * .6)];
    tomato.lineWidth = 2;
    [[UIColor redColor] setFill];
    [[UIColor blackColor] setStroke];
    [tomato fill];
    [tomato stroke];
    
    // Lettuce
    UIBezierPath *lettuce = [[[UIBezierPath alloc] init] autorelease];
    [lettuce moveToPoint:CGPointMake(maxX * .1, maxY * .475)];
    [lettuce addCurveToPoint:CGPointMake(maxX * .3, maxY * .475) controlPoint1:CGPointMake(maxX * .175, maxY * .45) controlPoint2:CGPointMake(maxX * .225, maxY * .45)];
    [lettuce addCurveToPoint:CGPointMake(maxX * .5, maxY * .475) controlPoint1:CGPointMake(maxX * .375, maxY * .5) controlPoint2:CGPointMake(maxX * .425, maxY * .5)];
    [lettuce addCurveToPoint:CGPointMake(maxX * .7, maxY * .475) controlPoint1:CGPointMake(maxX * .575, maxY * .45) controlPoint2:CGPointMake(maxX * .625, maxY * .45)];
    [lettuce addCurveToPoint:CGPointMake(maxX * .9, maxY * .475) controlPoint1:CGPointMake(maxX * .775, maxY * .5) controlPoint2:CGPointMake(maxX * .825, maxY * .5)];
    [lettuce addLineToPoint:CGPointMake(maxX * .9, maxY * .425)];
    [lettuce addCurveToPoint:CGPointMake(maxX * .7, maxY * .425) controlPoint1:CGPointMake(maxX * .825, maxY * .45) controlPoint2:CGPointMake(maxX * .775, maxY * .45)];
    [lettuce addCurveToPoint:CGPointMake(maxX * .5, maxY * .425) controlPoint1:CGPointMake(maxX * .625, maxY * .4) controlPoint2:CGPointMake(maxX * .575, maxY * .4)];
    [lettuce addCurveToPoint:CGPointMake(maxX * .3, maxY * .425) controlPoint1:CGPointMake(maxX * .425, maxY * .45) controlPoint2:CGPointMake(maxX * .375, maxY * .45)];
    [lettuce addCurveToPoint:CGPointMake(maxX * .1, maxY * .425) controlPoint1:CGPointMake(maxX * .225, maxY * .4) controlPoint2:CGPointMake(maxX * .175, maxY * .4)];
    [lettuce addLineToPoint:CGPointMake(maxX * .1, maxY * .475)];
    lettuce.lineWidth = 2;
    [[UIColor greenColor] setFill];
    [[UIColor blackColor] setStroke];
    [lettuce fill];
    [lettuce stroke];
    
    // Cheese
    UIBezierPath *cheese = [[[UIBezierPath alloc] init] autorelease];
    [cheese moveToPoint:CGPointMake(maxX * .15, maxY * .4)];
    [cheese addLineToPoint:CGPointMake(maxX * .15, maxY * .35)];
    [cheese addLineToPoint:CGPointMake(maxX * .85, maxY * .35)];
    [cheese addLineToPoint:CGPointMake(maxX * .85, maxY * .4)];
    [cheese addLineToPoint:CGPointMake(maxX * .15, maxY * .4)];
    cheese.lineWidth = 2;
    [[UIColor yellowColor] setFill];
    [[UIColor blackColor] setStroke];
    [cheese fill];
    [cheese stroke];
    
    // Top bun
    UIBezierPath *topBun = [[[UIBezierPath alloc] init] autorelease];
    [topBun moveToPoint:CGPointMake(maxX * .2, maxY * .35)];
    [topBun addCurveToPoint:CGPointMake(maxX * .1, maxY * .3) controlPoint1:CGPointMake(maxX * .125, maxY * .35) controlPoint2:CGPointMake(maxX * .1, maxY * .325)];
    [topBun addCurveToPoint:CGPointMake(maxX * .5, maxY * .175) controlPoint1:CGPointMake(maxX * .1, maxY * .225) controlPoint2:CGPointMake(maxX * .2, maxY * .175)];
    [topBun addCurveToPoint:CGPointMake(maxX * .9, maxY * .3) controlPoint1:CGPointMake(maxX * .8, maxY * .175) controlPoint2:CGPointMake(maxX * .9, maxY * .225)];
    [topBun addCurveToPoint:CGPointMake(maxX * .8, maxY * .35) controlPoint1:CGPointMake(maxX * .9, maxY * .325) controlPoint2:CGPointMake(maxX * .875, maxY * .35)];
    [topBun addLineToPoint:CGPointMake(maxX * .2, maxY * .35)];
    topBun.lineWidth = 3;
    [[UIColor orangeColor] setFill];
    [[UIColor blackColor] setStroke];
    [topBun fill];
    [topBun stroke];
    
    
    
}

@end
