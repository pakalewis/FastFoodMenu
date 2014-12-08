//
//  MealOrder.h
//  BurgerSample
//
//  Created by Parker Lewis on 11/24/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MealOrder : NSObject


typedef enum {
    none,
    hamburger,
    hotdog,
    taco,
    pizza
} MainMeal;


@property (nonatomic, assign) MainMeal state;
@property (assign, nonatomic) BOOL tomato;
@property (assign, nonatomic) BOOL onion;
@property (assign, nonatomic) BOOL lettuce;
@property (assign, nonatomic) BOOL ketchup;
@property (assign, nonatomic) BOOL mustard;

// make dictionary for all these properties rather than individual


@end
