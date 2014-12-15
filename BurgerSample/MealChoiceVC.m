//
//  MealChoiceVC.m
//  BurgerSample
//
//  Created by Parker Lewis on 11/24/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "MealChoiceVC.h"
#import "DrawBurger.h"
#import "DrawHotDog.h"
#import "DrawTaco.h"
#import "DrawPizza.h"

@interface MealChoiceVC ()


@property (strong, nonatomic) UIView *drawMealChoices;
@property (strong, nonatomic) UILabel *chooseYourMealLabel;
@property (strong, nonatomic) UILabel *choiceLabel;

-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer;


@end

@implementation MealChoiceVC

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load the drawings
    self.drawMealChoices = [[[UIView alloc] init] autorelease];
    self.drawMealChoices.translatesAutoresizingMaskIntoConstraints = NO;
    self.drawMealChoices.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.drawMealChoices];
    

    
    // Make burger label
    self.chooseYourMealLabel = [[[UILabel alloc] init] autorelease];
    self.chooseYourMealLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.chooseYourMealLabel.text = @"Choose your meal";
    self.chooseYourMealLabel.backgroundColor = [UIColor clearColor];
    self.chooseYourMealLabel.font = [UIFont boldSystemFontOfSize:20];
    self.chooseYourMealLabel.textColor = [UIColor blackColor];
    self.chooseYourMealLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.chooseYourMealLabel];
    
    CALayer *topBorder = [CALayer layer];
    topBorder.borderWidth = 2;
    topBorder.frame = CGRectMake(0, 0, self.view.frame.size.width, 2);
    [topBorder setBorderColor:[UIColor blackColor].CGColor];
    [self.chooseYourMealLabel.layer addSublayer:topBorder];
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.borderWidth = 2;
    bottomBorder.frame = CGRectMake(0, 49, self.view.frame.size.width, 2);
    [bottomBorder setBorderColor:[UIColor blackColor].CGColor];
    [self.chooseYourMealLabel.layer addSublayer:bottomBorder];

    
    // Make label
    self.choiceLabel = [[[UILabel alloc] init] autorelease];
    self.choiceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.choiceLabel.text = @"You will eat: ";
    self.choiceLabel.font = [UIFont boldSystemFontOfSize:20];
    self.choiceLabel.textColor = [UIColor blackColor];
    self.choiceLabel.backgroundColor = [UIColor clearColor];
    self.choiceLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.choiceLabel.layer.borderWidth = 1;
    self.choiceLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.choiceLabel];


    self.singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
    [self.drawMealChoices addGestureRecognizer: self.singleTapGestureRecognizer];
    
    
    [self setupConstraints];

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    float maxX = self.drawMealChoices.frame.size.width;
    float maxY = self.drawMealChoices.frame.size.height;
    
    DrawBurger *burgerDrawing = [[[DrawBurger alloc] init]autorelease];
    [self.drawMealChoices addSubview:burgerDrawing];
    burgerDrawing.frame = CGRectMake(0, 0, maxX / 2, maxY / 2);
    burgerDrawing.backgroundColor = [UIColor clearColor];
    
    DrawHotDog *hotDogDrawing = [[[DrawHotDog alloc] init]autorelease];
    [self.drawMealChoices addSubview:hotDogDrawing];
    hotDogDrawing.frame = CGRectMake(maxX / 2, 0, maxX / 2, maxY / 2);
    hotDogDrawing.backgroundColor = [UIColor clearColor];
    
    DrawTaco *tacoDrawing = [[[DrawTaco alloc] init]autorelease];
    [self.drawMealChoices addSubview:tacoDrawing];
    tacoDrawing.frame = CGRectMake(0, maxY / 2, maxX / 2, maxY / 2);
    tacoDrawing.backgroundColor = [UIColor clearColor];
    
    DrawPizza *pizzaDrawing = [[[DrawPizza alloc] init]autorelease];
    [self.drawMealChoices addSubview:pizzaDrawing];
    pizzaDrawing.frame = CGRectMake(maxX / 2, maxY / 2, maxX / 2, maxY / 2);
    pizzaDrawing.backgroundColor = [UIColor clearColor];
    
}

-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer {
    


    NSDictionary *userInfo = [[[NSDictionary alloc] init] autorelease];

    CGPoint p = [tapGestureRecognizer locationInView:self.drawMealChoices];
    if (p.x < self.drawMealChoices.frame.size.width / 2 && p.y < self.drawMealChoices.frame.size.height / 2) {
        NSLog(@"it's in burger section");
        self.choiceLabel.text = @"You will eat: BURGERS";
        userInfo = @{@"meal": @1};
    } else if (p.x > self.drawMealChoices.frame.size.width / 2 && p.y < self.drawMealChoices.frame.size.height / 2) {
        NSLog(@"it's in hotdog section");
        self.choiceLabel.text = @"You will eat: HOTDOGS";
        userInfo = @{@"meal": @2};
    } else if (p.x < self.drawMealChoices.frame.size.width / 2 && p.y > self.drawMealChoices.frame.size.height / 2) {
        NSLog(@"it's in taco");
        self.choiceLabel.text = @"You will eat: TACOS";
        userInfo = @{@"meal": @3};
    } else {
        NSLog(@"it's in pizza section");
        self.choiceLabel.text = @"You will eat: PIZZA";
        userInfo = @{@"meal": @4};
    }
    
    NSNotification *newMealNotification = [[[NSNotification alloc] initWithName:@"NEW_MEAL_CHOICE" object:nil userInfo:userInfo] autorelease];
    [[NSNotificationCenter defaultCenter] postNotification:newMealNotification];

}


- (void) setupConstraints {
    
    NSDictionary *viewsDictionary = @{@"drawMealChoices": self.drawMealChoices,
                                      @"chooseYourMealLabel": self.chooseYourMealLabel,
                                      @"choiceLabel": self.choiceLabel};
    
    // Choose your meal label
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[chooseYourMealLabel(50)]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-30-[chooseYourMealLabel]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];


    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.chooseYourMealLabel
                                                          attribute: NSLayoutAttributeCenterX
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeCenterX
                                                         multiplier: 1
                                                           constant: 0]
     ];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.chooseYourMealLabel
                                                          attribute: NSLayoutAttributeWidth
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeWidth
                                                         multiplier: 1
                                                           constant: 0]
     ];
    
    
    
    
    
    // DrawMealChoices
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[chooseYourMealLabel]-30-[drawMealChoices]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.drawMealChoices
                                                          attribute: NSLayoutAttributeCenterX
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeCenterX
                                                         multiplier: 1
                                                           constant: 0]
     ];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.drawMealChoices
                                                          attribute: NSLayoutAttributeWidth
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeWidth
                                                         multiplier: 0.85
                                                           constant: 0]
     ];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.drawMealChoices
                                                          attribute: NSLayoutAttributeHeight
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.drawMealChoices
                                                          attribute: NSLayoutAttributeWidth
                                                         multiplier: 1
                                                           constant: 0]
     ];
    
    
    
    // Choice label
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[choiceLabel(80)]"
                               options:0
                               metrics:nil
                               views:viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[drawMealChoices]-20-[choiceLabel]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.choiceLabel
                                                          attribute: NSLayoutAttributeCenterX
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeCenterX
                                                         multiplier: 1
                                                           constant: 0]
     ];

//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.choiceLabel
//                                                          attribute: NSLayoutAttributeWidth
//                                                          relatedBy: NSLayoutRelationEqual
//                                                             toItem: self.drawMealChoices
//                                                          attribute: NSLayoutAttributeWidth
//                                                         multiplier: 0.75
//                                                           constant: 0]
//     ];
}



- (void)dealloc
{
    [super dealloc];
}

@end
