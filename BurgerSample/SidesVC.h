//
//  SidesVC.h
//  BurgerSample
//
//  Created by Parker Lewis on 11/24/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SidesVC : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *sidesTableView;
@property (strong, nonatomic) UIColor *themeColor;


@end
