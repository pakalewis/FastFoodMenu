//
//  FinalOrderVC.m
//  BurgerSample
//
//  Created by Parker Lewis on 12/10/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "FinalOrderVC.h"

@interface FinalOrderVC ()

@property (strong, nonatomic) UILabel *reviewYourOrderLabel;
@property (strong, nonatomic) UILabel *mealLabel1;
@property (strong, nonatomic) UILabel *mealLabel2;
@property (strong, nonatomic) UILabel *toppingsLabel1;
@property (strong, nonatomic) UILabel *toppingsLabel2;
@property (strong, nonatomic) UILabel *sidesLabel1;
@property (strong, nonatomic) UILabel *sidesLabel2;


@end

@implementation FinalOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mealOrder = [[[MealOrder alloc] init] autorelease];

    // Make Review label
    self.reviewYourOrderLabel = [[[UILabel alloc] init] autorelease];
    self.reviewYourOrderLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.reviewYourOrderLabel.text = @"Review your order";
    self.reviewYourOrderLabel.backgroundColor = [UIColor grayColor];
    self.reviewYourOrderLabel.font = [UIFont boldSystemFontOfSize:20];
    self.reviewYourOrderLabel.textColor = [UIColor blackColor];
    self.reviewYourOrderLabel.layer.cornerRadius = 15;
    self.reviewYourOrderLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.reviewYourOrderLabel.layer.borderWidth = 2;
    self.reviewYourOrderLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.reviewYourOrderLabel];
    
    // Make meal labels
    self.mealLabel1 = [[[UILabel alloc] init] autorelease];
    self.mealLabel1.translatesAutoresizingMaskIntoConstraints = NO;
    self.mealLabel1.backgroundColor = [UIColor grayColor];
    self.mealLabel1.font = [UIFont boldSystemFontOfSize:20];
    self.mealLabel1.text = @"MEAL";
    self.mealLabel1.textAlignment = NSTextAlignmentCenter;
    self.mealLabel1.textColor = [UIColor blackColor];
    [self.view addSubview:self.mealLabel1];
    
    self.mealLabel2 = [[[UILabel alloc] init] autorelease];
    self.mealLabel2.translatesAutoresizingMaskIntoConstraints = NO;
    self.mealLabel2.backgroundColor = [UIColor grayColor];
    self.mealLabel2.font = [UIFont boldSystemFontOfSize:15];
    self.mealLabel2.textAlignment = NSTextAlignmentCenter;
//    self.mealLabel2.numberOfLines = 0;
    self.mealLabel2.textColor = [UIColor blackColor];
    self.mealLabel2.layer.borderColor = [[UIColor blackColor] CGColor];
    self.mealLabel2.layer.borderWidth = 1;
    [self.view addSubview:self.mealLabel2];
    
    // Make toppings label
    self.toppingsLabel1 = [[[UILabel alloc] init] autorelease];
    self.toppingsLabel1.translatesAutoresizingMaskIntoConstraints = NO;
    self.toppingsLabel1.backgroundColor = [UIColor grayColor];
    self.toppingsLabel1.font = [UIFont boldSystemFontOfSize:20];
    self.toppingsLabel1.text = @"TOPPINGS";
    self.toppingsLabel1.textAlignment = NSTextAlignmentCenter;
    self.toppingsLabel1.textColor = [UIColor blackColor];
    [self.view addSubview:self.toppingsLabel1];

    self.toppingsLabel2 = [[[UILabel alloc] init] autorelease];
    self.toppingsLabel2.translatesAutoresizingMaskIntoConstraints = NO;
    self.toppingsLabel2.backgroundColor = [UIColor grayColor];
    self.toppingsLabel2.font = [UIFont boldSystemFontOfSize:15];
    self.toppingsLabel2.textColor = [UIColor blackColor];
    self.toppingsLabel2.numberOfLines = 0;
    self.toppingsLabel2.text = @"  Nothing selected yet";
//    self.toppingsLabel2.lineBreakMode = NSLineBreakByWordWrapping;
//    self.toppingsLabel2.textAlignment = NSTextAlignmentLeft;
    self.toppingsLabel2.layer.borderColor = [[UIColor blackColor] CGColor];
    self.toppingsLabel2.layer.borderWidth = 1;
    [self.view addSubview:self.toppingsLabel2];
    
    // Make sides labels
    self.sidesLabel1 = [[[UILabel alloc] init] autorelease];
    self.sidesLabel1.translatesAutoresizingMaskIntoConstraints = NO;
    self.sidesLabel1.backgroundColor = [UIColor grayColor];
    self.sidesLabel1.font = [UIFont boldSystemFontOfSize:20];
    self.sidesLabel1.text = @"SIDES";
    self.sidesLabel1.textAlignment = NSTextAlignmentCenter;
    self.sidesLabel1.textColor = [UIColor blackColor];
    [self.view addSubview:self.sidesLabel1];

    self.sidesLabel2 = [[[UILabel alloc] init] autorelease];
    self.sidesLabel2.translatesAutoresizingMaskIntoConstraints = NO;
    self.sidesLabel2.backgroundColor = [UIColor grayColor];
    self.sidesLabel2.font = [UIFont boldSystemFontOfSize:15];
    self.sidesLabel2.textColor = [UIColor blackColor];
    self.sidesLabel2.text = @"  Nothing selected yet";
    self.sidesLabel2.layer.borderColor = [[UIColor blackColor] CGColor];
    self.sidesLabel2.layer.borderWidth = 1;
    [self.view addSubview:self.sidesLabel2];
    
    
    [self setupConstraints];

    
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
    
    switch (self.mealOrder.state) {
        case hamburger:
            self.mealLabel2.text = @"Hamburger!";
            break;
        case hotdog:
            self.mealLabel2.text = @"Hot dog!";
            break;
        case taco:
            self.mealLabel2.text = @"Taco!";
            break;
        case pizza:
            self.mealLabel2.text = @"Pizza!";
            break;
        case none:
            break;
    }

}


// update for the toppings
-(void) toppingsUpdated:(NSNotification*) notification {
    
    self.mealOrder.chosenToppings = notification.object;
    
    if (self.mealOrder.chosenToppings.firstObject == nil) {
        self.toppingsLabel2.text = @"  Nothing selected yet";
        return;
    } else {
        NSString *toppingsString = [[[NSString alloc] init] autorelease];
        NSLog(@"   - %@", toppingsString);
        
        for (NSString *topping in self.mealOrder.chosenToppings) {
            toppingsString = [toppingsString stringByAppendingString:@"\n   - "];
            toppingsString = [toppingsString stringByAppendingString:topping];
        }
        
        self.toppingsLabel2.text = toppingsString;
    }
}





-(void) setupConstraints {
    NSDictionary *viewsDictionary = @{@"reviewYourOrderLabel": self.reviewYourOrderLabel,
                                      @"mealLabel1": self.mealLabel1,
                                      @"toppingsLabel1": self.toppingsLabel1,
                                      @"sidesLabel1": self.sidesLabel1,
                                      @"mealLabel2": self.mealLabel2,
                                      @"toppingsLabel2": self.toppingsLabel2,
                                      @"sidesLabel2": self.sidesLabel2};
    
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[reviewYourOrderLabel(50)]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-30-[reviewYourOrderLabel]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.reviewYourOrderLabel
                                                          attribute: NSLayoutAttributeCenterX
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeCenterX
                                                         multiplier: 1
                                                           constant: 0]
     ];
    
    
    // MEAL labels
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[mealLabel1(40)]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.mealLabel1
                                                          attribute: NSLayoutAttributeCenterX
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.mealLabel2
                                                          attribute: NSLayoutAttributeCenterX
                                                         multiplier: 1
                                                           constant: 0]
     ];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.mealLabel1
                                                          attribute: NSLayoutAttributeWidth
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.mealLabel2
                                                          attribute: NSLayoutAttributeWidth
                                                         multiplier: 1
                                                           constant: 0]
     ];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.mealLabel1
                                                          attribute: NSLayoutAttributeWidth
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeWidth
                                                         multiplier: 0.4
                                                           constant: 0]
     ];
    
    
    // TOPPINGS labels
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[toppingsLabel1(40)]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.toppingsLabel1
                                                          attribute: NSLayoutAttributeCenterX
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.toppingsLabel2
                                                          attribute: NSLayoutAttributeCenterX
                                                         multiplier: 1
                                                           constant: 0]
     ];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.toppingsLabel1
                                                          attribute: NSLayoutAttributeWidth
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.toppingsLabel2
                                                          attribute: NSLayoutAttributeWidth
                                                         multiplier: 1
                                                           constant: 0]
     ];
    
    
    // SIDES labels
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[sidesLabel1(40)]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.sidesLabel1
                                                          attribute: NSLayoutAttributeCenterX
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.sidesLabel2
                                                          attribute: NSLayoutAttributeCenterX
                                                         multiplier: 1
                                                           constant: 0]
     ];
    

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.sidesLabel1
                                                          attribute: NSLayoutAttributeWidth
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.sidesLabel2
                                                          attribute: NSLayoutAttributeWidth
                                                         multiplier: 1
                                                           constant: 0]
     ];
    

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.sidesLabel2
                                                          attribute: NSLayoutAttributeHeight
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeHeight
                                                         multiplier: 0.25
                                                           constant: 0]
     ];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-10-[mealLabel1]-10-[toppingsLabel1]-10-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-30-[sidesLabel1]-30-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[reviewYourOrderLabel]-20-[mealLabel1]-5-[mealLabel2]-10-[sidesLabel1]-5-[sidesLabel2]-70-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[reviewYourOrderLabel]-20-[toppingsLabel1]-5-[toppingsLabel2]-10-[sidesLabel1]-5-[sidesLabel2]-70-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
}



@end
