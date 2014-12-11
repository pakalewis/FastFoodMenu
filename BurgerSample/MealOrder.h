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
@property (strong, nonatomic) NSMutableArray *chosenToppings;



@end
