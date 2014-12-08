//
//  ToppingsVC.h
//  BurgerSample
//
//  Created by Parker Lewis on 11/24/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MealOrder.h"

@interface ToppingsVC : UIViewController <UITableViewDataSource, UITableViewDelegate>



@property (nonatomic, assign) MainMeal state;
@property (strong, nonatomic) UITableView *toppingsTableView;
@property (strong, nonatomic) UIColor *themeColor;




@end
