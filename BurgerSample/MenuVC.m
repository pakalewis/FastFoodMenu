//
//  MenuVC.m
//  BurgerSample
//
//  Created by Parker Lewis on 11/24/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "MenuVC.h"
#import "MenuCell.h"
#import "UIButton+CustomButton.h"

@interface MenuVC ()

typedef enum {
    meat,
    toppings,
    sides,
    placeOrder
} MenuSection;


@property (assign, nonatomic) BOOL isOpeningDisplay;
@property (nonatomic, assign) MenuSection menuSectionState;
@property (strong, nonatomic) NSArray *menuSections;
@property (strong, nonatomic) NSArray *subliminalMessages;
@property (nonatomic, strong) NSArray *colors;
@property (strong, nonatomic) NSArray *menuImages;
@property (strong, nonatomic) NSDictionary *viewsDictionary;
@property (strong, nonatomic) UIButton *menuButton;
@property (strong, nonatomic) UIButton *placeOrderButton;
@property (strong, nonatomic) UITableView *menuTableView;

@property (strong, nonatomic) NSLayoutConstraint *containerViewCenterXConstraint;
@property (strong, nonatomic) NSLayoutConstraint *menuButtonLeftConstraint;
@property (strong, nonatomic) NSLayoutConstraint *placeOrderButtonRightConstraint;


-(void)handleSwipeGesture:(UISwipeGestureRecognizer *)swipeGestureRecognizer;




@end

@implementation MenuVC



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mealOrder = [[[MealOrder alloc] init] autorelease];
    self.view.backgroundColor = self.colors[0];
    self.isOpeningDisplay = YES;

    
    self.menuSections = [NSArray arrayWithObjects:@"MEAL", @"TOPPINGS", @"SIDES", @"PLACE ORDER", nil];
    self.subliminalMessages = @[@"Make it a combo meal!", @"You are very very hungry", @"Eat eat eat eat eat", @"Get in my belly!"];
    
    self.colors = [[[NSArray alloc] initWithObjects: UIColorFromRGB(0x2162a6), UIColorFromRGB(0x57a515), UIColorFromRGB(0xd0661e), UIColorFromRGB(0x21A4A6), nil] autorelease];
    
    self.menuImages = [[[NSArray alloc] initWithObjects: [UIImage imageNamed:@"burger"], [UIImage imageNamed:@"toppings"], [UIImage imageNamed:@"sides"], [UIImage imageNamed:@"eat-oclock"], nil] autorelease];
    
    
    // TODO: Can I fix this so each item is initialized in its setup func and not here? How best to add to the viewsDictionary?
    self.menuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.placeOrderButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.menuTableView = [[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain] autorelease];
    self.containerView = [[[UIView alloc] init] autorelease];
    self.viewsDictionary = @{@"menuButton":self.menuButton,
                             @"placeOrderButton":self.placeOrderButton,
                             @"containerView":self.containerView,
                             @"tableView":self.menuTableView};

    
    

    
    
    // Set up views
    [self setupTableView];
    [self setupContainerView];
    [self setupButtons];
    
    // start with these views off screen
    self.menuButtonLeftConstraint.constant = self.view.frame.size.width * 2;
    self.placeOrderButtonRightConstraint.constant = self.view.frame.size.width * 2;
    self.containerViewCenterXConstraint.constant = self.view.frame.size.width;
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeState:) name:@"CHANGE_MENU_STATE" object:nil];

}

-(void) changeState:(NSNotification*) notification {
    
    int changeToState = [[notification.userInfo objectForKey:@"state"] intValue];
    NSLog(@"%D", changeToState);
    if (changeToState == 0) {
        self.menuSectionState = 0;
    } else if (changeToState == 1) {
        self.menuSectionState = 1;
    } else {
        self.menuSectionState = 2;
    }
    
    [self updateContainerView];
}




// MARK: SETUP

-(void) setupButtons {
//    self.menuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.menuButton setUpButtonWithTitle:@"MENU"];
    [self.menuButton addTarget:self action:@selector(didPressMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.menuButton];
    
    [self.placeOrderButton setUpButtonWithTitle:@"PLACE ORDER"];
    [self.placeOrderButton addTarget:self action:@selector(didPressPlaceOrderButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.placeOrderButton];
    
    // Constraint is a property so I can get at the constant when animating
    NSLayoutConstraint *menuButtonLeftConstraint = [NSLayoutConstraint constraintWithItem: self.menuButton
                                                                                attribute: NSLayoutAttributeLeft
                                                                                relatedBy: NSLayoutRelationEqual
                                                                                   toItem: self.view
                                                                                attribute: NSLayoutAttributeLeft
                                                                               multiplier: 1
                                                                                 constant: 20];
    
    [self.view addConstraint:menuButtonLeftConstraint];
    self.menuButtonLeftConstraint = menuButtonLeftConstraint;
    
    
    // Constraint is a property so I can get at the constant when animating
    NSLayoutConstraint *placeOrderButtonRightConstraint = [NSLayoutConstraint constraintWithItem: self.placeOrderButton
                                                                                attribute: NSLayoutAttributeRight
                                                                                relatedBy: NSLayoutRelationEqual
                                                                                   toItem: self.view
                                                                                attribute: NSLayoutAttributeRight
                                                                               multiplier: 1
                                                                                 constant: -20];
    
    [self.view addConstraint:placeOrderButtonRightConstraint];
    self.placeOrderButtonRightConstraint = placeOrderButtonRightConstraint;
    
    
    
    
    // Heighth and width
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:[menuButton(80)]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:self.viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[menuButton(50)]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:self.viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:[placeOrderButton(170)]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:self.viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[placeOrderButton(50)]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:self.viewsDictionary]];
    

    
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[menuButton]-10-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:self.viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[placeOrderButton]-10-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:self.viewsDictionary]];
    
}





-(void) setupTableView {
    // Table view set up
//    self.menuTableView = [[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain] autorelease];
    self.menuTableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.menuTableView];
    self.menuTableView.delegate = self;
    self.menuTableView.scrollEnabled = NO;
    self.menuTableView.dataSource = self;
    
    // Tableview constraints
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-0-[tableView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:self.viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-0-[tableView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:self.viewsDictionary]];
    

    
    
}


-(void) setupContainerView {
    // Make container view
//    self.containerView = [[[UIView alloc] init] autorelease];
    
    UISwipeGestureRecognizer *leftSwipeGestureRecognizer = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)] autorelease];
    leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *rightSwipeGestureRecognizer = [[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)] autorelease];
    rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    
    [self.containerView addGestureRecognizer: rightSwipeGestureRecognizer];
    [self.containerView addGestureRecognizer: leftSwipeGestureRecognizer];
    

    
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.containerView.frame = CGRectMake(self.view.frame.size.width, 0, self.menuTableView.frame.size.width, self.menuTableView.frame.size.height);
    [self.view addSubview:self.containerView];
    
    
    // Container constraints
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.containerView
                                                           attribute: NSLayoutAttributeHeight
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute: NSLayoutAttributeHeight
                                                          multiplier: 1
                                                            constant: 0]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.containerView
                                                           attribute: NSLayoutAttributeWidth
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute: NSLayoutAttributeWidth
                                                          multiplier: 1
                                                            constant: 0]];

    // This constraint is a property so I can get at the constant when animating
    self.containerViewCenterXConstraint = [NSLayoutConstraint constraintWithItem: self.containerView
                                                                       attribute: NSLayoutAttributeCenterX
                                                                       relatedBy: NSLayoutRelationEqual
                                                                          toItem: self.view
                                                                       attribute: NSLayoutAttributeCenterX
                                                                      multiplier: 1
                                                                        constant: 0];
    [self.view addConstraint:self.containerViewCenterXConstraint];

    
    // Initialize four detail VCs
    self.mealChoiceVC = [[[MealChoiceVC alloc] init] autorelease];
    self.mealChoiceVC.view.backgroundColor = self.colors[0];

    self.toppingsVC = [[[ToppingsVC alloc] init] autorelease];
    self.toppingsVC.view.backgroundColor = self.colors[1];
    self.toppingsVC.themeColor = self.colors[1];
    
    self.sidesVC = [[[SidesVC alloc] init] autorelease];
    self.sidesVC.view.backgroundColor = self.colors[2];
    self.sidesVC.themeColor = self.colors[2];

    self.finalOrderVC = [[[FinalOrderVC alloc] init] autorelease];
    self.finalOrderVC.view.backgroundColor = self.colors[3];
    

    // Add as child View Controllers
    [self addChildViewController: self.mealChoiceVC];
    [self addChildViewController: self.toppingsVC];
    [self addChildViewController: self.sidesVC];
    [self addChildViewController:self.finalOrderVC];
    
    // Add three detail VCs to the containerview
    [self.containerView addSubview:self.mealChoiceVC.view];
    self.mealChoiceVC.view.frame = self.containerView.bounds;
    [self.containerView addSubview:self.toppingsVC.view];
    self.toppingsVC.view.frame = self.containerView.bounds;
    [self.containerView addSubview:self.sidesVC.view];
    self.sidesVC.view.frame = self.containerView.bounds;
    [self.containerView addSubview:self.finalOrderVC.view];
    self.finalOrderVC.view.frame = self.containerView.bounds;
    
    [self.mealChoiceVC didMoveToParentViewController: self];
    [self.toppingsVC didMoveToParentViewController: self];
    [self.sidesVC didMoveToParentViewController: self];
    [self.finalOrderVC didMoveToParentViewController: self];
}









// MARK: TABLEVIEW METHODS
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.height / 4;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MenuCell *cell = [self.menuTableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [[MenuCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CELL"];

        cell.contentView.backgroundColor = self.colors[indexPath.row];

        cell.menuLabel.text = self.menuSections[indexPath.row];
        cell.menuCellImage.image = self.menuImages[indexPath.row];
        cell.subliminalMessageLabel.text = self.subliminalMessages[indexPath.row];
    }
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // User tries to proceed but has not picked a meal so present ALERT
    if (indexPath.row != 0 && self.finalOrderVC.mealOrder.state == 0) {

        NSLog(@"nothing picked yet");
//        UIAlertController *alert = [[[UIAlertController alloc] init] autorelease];
//        alert = [UIAlertController alertControllerWithTitle:@"First choose the main course!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//        [alert addAction:okAction];
//        [self presentViewController:alert animated:true completion:nil];
//        return;
    } else { // No alert necessary because user selected row 0 (meal choice)
        self.menuTableView.userInteractionEnabled = NO;
        if (self.isOpeningDisplay) { // self.menusectionState is already set to meat = 0
            [self switchViews];
            [self slideInViews];
            self.isOpeningDisplay = NO;
        } else {
            if (indexPath.row == self.menuSectionState) {
                // Container view already has the selection loaded so just slide back in
                NSLog(@"Selection is already loaded so just slide back in");
                [self slideInViews];
            } else { // User selected a new VC. need to set the state and then update the containerView
                NSLog(@"here");
                // set the menuSelectionState
                if (indexPath.row == 0) {
                    self.menuSectionState = meat;
                } else if (indexPath.row == 1) {
                    self.menuSectionState = toppings;
                } else if (indexPath.row == 2) {
                    self.menuSectionState = sides;
                } else {
                    self.menuSectionState = placeOrder;
                }
                [self updateContainerView];
            }
        }
    }
}



// MARK: ANIMATIONS
-(void)handleSwipeGesture:(UISwipeGestureRecognizer *)swipeGestureRecognizer {
    
    if (swipeGestureRecognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        [self slideViewsHalfOff];
    } else {
        [self slideInViews];
    }
}



// TODO: either remove this button (because the swipe gestures do the same thing) or make it three buttons that would hyperlink to the other three VC - set menuSectionState and then trigger updateContainerView

- (IBAction)didPressMenuButton:(id)sender {
    
    if (self.finalOrderVC.mealOrder.state == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"You didn't select a meal!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:true completion:nil];
        return;
    }
    
    [self slideViewsHalfOff];
}


- (IBAction)didPressPlaceOrderButton:(id)sender {
    
    if (self.finalOrderVC.mealOrder.state == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"You didn't select a meal!" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        [self presentViewController:alert animated:true completion:nil];
        return;
    }
    
    self.menuSectionState = placeOrder;
    [self updateContainerView];
}


-(void)switchViews {

    [self.containerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    switch (self.menuSectionState) {
        case meat:
            [self.containerView addSubview:self.mealChoiceVC.view];
            self.mealChoiceVC.view.frame = self.containerView.bounds;
            break;
        case toppings:
            [self.containerView addSubview:self.toppingsVC.view];
            self.toppingsVC.view.frame = self.containerView.bounds;
            break;
        case sides:
            [self.containerView addSubview:self.sidesVC.view];
            self.sidesVC.view.frame = self.containerView.bounds;
            break;
        case placeOrder:
            [self.containerView addSubview:self.finalOrderVC.view];
            self.finalOrderVC.view.frame = self.containerView.bounds;
            break;
    }
}


-(void)slideInViews {
    
    self.mealChoiceVC.singleTapGestureRecognizer.enabled = YES;
    self.menuButtonLeftConstraint.constant = 20;
    if (self.menuSectionState != placeOrder) {
        self.placeOrderButtonRightConstraint.constant = -20;
    }
    self.containerViewCenterXConstraint.constant = 0;
    [self.view setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.7 animations:^{
        [self.view layoutIfNeeded];
    }];
}


-(void)slideViewsHalfOff {
    
    self.mealChoiceVC.singleTapGestureRecognizer.enabled = NO;
    self.menuTableView.userInteractionEnabled = YES;
    self.menuButtonLeftConstraint.constant = self.view.frame.size.width;
    self.placeOrderButtonRightConstraint.constant = self.view.frame.size.width;
    self.containerViewCenterXConstraint.constant = self.view.frame.size.width * .5;
    [self.view setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.7 animations:^{
        [self.view layoutIfNeeded];
    }];
}


-(void)updateContainerView {
    
    self.menuButtonLeftConstraint.constant = self.view.frame.size.width;
    self.placeOrderButtonRightConstraint.constant = self.view.frame.size.width;
    self.containerViewCenterXConstraint.constant = self.view.frame.size.width;
    [self.view setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.7 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
        [self switchViews];
        [self slideInViews];
    }];
}






// Limit app to portrait only
-(BOOL)shouldAutorotate {
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}



// ARC stuff
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_mealChoiceVC release];
    [_colors release];
    [_toppingsVC release];
    [_sidesVC release];
    [_containerView release];
    [super dealloc];
}




@end
