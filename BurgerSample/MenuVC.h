//
//  MenuVC.h
//  BurgerSample
//
//  Created by Parker Lewis on 11/24/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MealChoiceVC.h"
#import "ToppingsVC.h"
#import "SidesVC.h"
#import "MealOrder.h"
#import "FinalOrderVC.h"

@interface MenuVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) MealChoiceVC *mealChoiceVC;
@property (strong, nonatomic) ToppingsVC *toppingsVC;
@property (strong, nonatomic) SidesVC *sidesVC;
@property (strong, nonatomic) FinalOrderVC *finalOrderVC;

@property (strong, nonatomic) MealOrder *mealOrder;


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

- (IBAction)didPressMenuButton:(id)sender;
- (IBAction)didPressPlaceOrderButton:(id)sender;

    
@end
