//
//  ToppingsVC.m
//  BurgerSample
//
//  Created by Parker Lewis on 11/24/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "ToppingsVC.h"
#import "CheckListCell.h"

@interface ToppingsVC ()

@property (strong, nonatomic) UILabel *chooseYourToppingsLabel;

@property (strong, nonatomic) NSArray *hamburgerToppings;
@property (strong, nonatomic) NSArray *hamburgerToppingsImages;

@property (strong, nonatomic) NSArray *hotdogToppings;
@property (strong, nonatomic) NSArray *hotdogToppingsImages;

@property (strong, nonatomic) NSArray *pizzaToppings;
@property (strong, nonatomic) NSArray *pizzaToppingsImages;

@property (strong, nonatomic) NSArray *tacoToppings;
@property (strong, nonatomic) NSArray *tacoToppingsImages;

@property (strong, nonatomic) NSArray *currentToppings;
@property (strong, nonatomic) NSArray *currentToppingsImages;


@property (strong, nonatomic) NSMutableArray *chosenToppings;





@end

@implementation ToppingsVC


-(void)viewDidLoad {
    [super viewDidLoad];


    
    self.hamburgerToppings = @[@"Tomato", @"Lettuce", @"Cheese", @"Onions", @"Pickles", @"Mustard"];
    self.hamburgerToppingsImages = @[[UIImage imageNamed:@"tomato"], [UIImage imageNamed:@"lettuce"], [UIImage imageNamed:@"cheese"], [UIImage imageNamed:@"onion"], [UIImage imageNamed:@"pickles"], [UIImage imageNamed:@"mustard"]];

    self.hotdogToppings = @[@"Ketchup", @"Mustard", @"Relish"];
    self.hotdogToppingsImages = @[[UIImage imageNamed:@"ketchup"], [UIImage imageNamed:@"mustard"], [UIImage imageNamed:@"relish"]];
    
    self.tacoToppings = @[@"Lettuce", @"Cheese", @"Onion", @"Salsa"];
    self.tacoToppingsImages = @[[UIImage imageNamed:@"lettuce"], [UIImage imageNamed:@"cheese"], [UIImage imageNamed:@"onion"], [UIImage imageNamed:@"salsa"]];

    self.pizzaToppings = @[@"Extra Cheese", @"Pepperoni", @"Sausage", @"Canadian Bacon", @"Mushroom", @"Pineapple", @"Olive", @"Garlic", @"Peppers", @"Onion"];
    self.pizzaToppingsImages = @[[UIImage imageNamed:@"cheese"], [UIImage imageNamed:@"pepperoni"], [UIImage imageNamed:@"sausage"], [UIImage imageNamed:@"canadianBacon"], [UIImage imageNamed:@"mushroom"], [UIImage imageNamed:@"pineapple"], [UIImage imageNamed:@"olive"], [UIImage imageNamed:@"garlic"], [UIImage imageNamed:@"peppers"], [UIImage imageNamed:@"onion"]];

    self.currentToppings = self.hamburgerToppings;
    self.currentToppingsImages = self.hamburgerToppingsImages;
    
    self.chosenToppings = [[[NSMutableArray alloc] init] autorelease];
    
    
    // Make Toppings label
    self.chooseYourToppingsLabel = [[[UILabel alloc] init] autorelease];
    self.chooseYourToppingsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.chooseYourToppingsLabel.text = @"Choose your toppings";
    self.chooseYourToppingsLabel.backgroundColor = [UIColor clearColor];
    self.chooseYourToppingsLabel.font = [UIFont boldSystemFontOfSize:20];
    self.chooseYourToppingsLabel.textColor = [UIColor blackColor];
    self.chooseYourToppingsLabel.layer.cornerRadius = 15;
    self.chooseYourToppingsLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.chooseYourToppingsLabel.layer.borderWidth = 2;
    self.chooseYourToppingsLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.chooseYourToppingsLabel];
    
    
    // make tableview
    self.toppingsTableView = [[[UITableView alloc] init] autorelease];
    self.toppingsTableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.toppingsTableView.delegate = self;
    self.toppingsTableView.dataSource = self;
    self.toppingsTableView.scrollEnabled = NO;
    self.toppingsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.toppingsTableView.backgroundColor = self.themeColor;
    [self.view addSubview:self.toppingsTableView];
    
    
    [self setupConstraints];
   
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mealChoiceUpdated:) name:@"NEW_MEAL_CHOICE" object:nil];

}


-(void) mealChoiceUpdated:(NSNotification*) notification {
    
    int changedState = [[notification.userInfo objectForKey:@"meal"] intValue];
    NSLog(@"%D", changedState);
    if (changedState == 1) {
        self.currentToppings = self.hamburgerToppings;
        self.currentToppingsImages = self.hamburgerToppingsImages;
        self.chooseYourToppingsLabel.text = @"Choose your hamburger toppings";
    } else if (changedState == 2) {
        self.currentToppings = self.hotdogToppings;
        self.currentToppingsImages = self.hotdogToppingsImages;
        self.chooseYourToppingsLabel.text = @"Choose your hot dog toppings";
    } else if (changedState == 3) {
        self.currentToppings = self.tacoToppings;
        self.currentToppingsImages = self.tacoToppingsImages;
        self.chooseYourToppingsLabel.text = @"Choose your taco toppings";
    } else if (changedState == 4) {
        self.currentToppings = self.pizzaToppings;
        self.currentToppingsImages = self.pizzaToppingsImages;
        self.chooseYourToppingsLabel.text = @"Choose your pizza toppings";
    } else {
        NSLog(@"NO CHOICE");
    }

    
    [self.toppingsTableView reloadData];

    [self.chosenToppings removeAllObjects];
    
    NSNotification *newToppingsNotification = [[[NSNotification alloc] initWithName:@"NEW_TOPPINGS" object:self.chosenToppings userInfo:nil] autorelease];
    [[NSNotificationCenter defaultCenter] postNotification:newToppingsNotification];
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CheckListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [[CheckListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.isChecked = NO;

    cell.checkboxImage.image = [UIImage imageNamed:@"uncheckedBox"];
    cell.itemLabel.text = self.currentToppings[indexPath.row];
    cell.backgroundColor = self.view.backgroundColor;
    cell.itemImage.image = self.currentToppingsImages[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.currentToppings.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (self.toppingsTableView.frame.size.height / [self.currentToppings count]) < 100 ? self.toppingsTableView.frame.size.height / [self.currentToppings count] : 100;    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CheckListCell *currentCell = (CheckListCell*) [self.toppingsTableView cellForRowAtIndexPath:indexPath];

    if (!currentCell.isChecked) {
        currentCell.checkboxImage.image = [UIImage imageNamed:@"checkedBox"];
        
        [self.chosenToppings addObject:self.currentToppings[indexPath.row]];
        currentCell.isChecked = YES;
    } else {
        currentCell.checkboxImage.image = [UIImage imageNamed:@"uncheckedBox"];
        [self.chosenToppings removeObject:self.currentToppings[indexPath.row]];
        currentCell.isChecked = NO;
    }

    
    
    NSNotification *newToppingsNotification = [[[NSNotification alloc] initWithName:@"NEW_TOPPINGS" object:self.chosenToppings userInfo:nil] autorelease];
    [[NSNotificationCenter defaultCenter] postNotification:newToppingsNotification];
}



-(void) setupConstraints {
    NSDictionary *viewsDictionary = @{@"chooseYourToppingsLabel": self.chooseYourToppingsLabel,
                                      @"toppingsTableView": self.toppingsTableView};
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[chooseYourToppingsLabel(50)]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-30-[chooseYourToppingsLabel]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.chooseYourToppingsLabel
                                                          attribute: NSLayoutAttributeCenterX
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeCenterX
                                                         multiplier: 1
                                                           constant: 0]
     ];
    
    
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-0-[toppingsTableView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[chooseYourToppingsLabel]-20-[toppingsTableView]-70-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];

}

@end
