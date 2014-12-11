//
//  FinalOrderVC.m
//  BurgerSample
//
//  Created by Parker Lewis on 12/10/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "FinalOrderVC.h"

@interface FinalOrderVC ()

@end

@implementation FinalOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mealOrder = [[[MealOrder alloc] init] autorelease];

    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(mealChoiceUpdated:)
                                                 name:@"NEW_MEAL_CHOICE"
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(toppingsUpdated:)
                                                 name:@"NEW_TOPPINGS"
                                               object:nil];
}



// update for the final mealOrder
-(void) mealChoiceUpdated:(NSNotification*) notification {
    NSLog(@"meal updated on finalorderVC");

    int state = [[notification.userInfo objectForKey:@"meal"] intValue];
    self.mealOrder.state = state;
}


// update for the toppings
-(void) toppingsUpdated:(NSNotification*) notification {
    self.mealOrder.chosenToppings = notification.object;
    
    NSLog(@"array: %@", self.mealOrder.chosenToppings);
}


@end
