//
//  UIButton+CustomButton.m
//  BurgerSample
//
//  Created by Parker Lewis on 12/16/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "UIButton+CustomButton.h"

@implementation UIButton (CustomButton)


-(void)setUpButtonWithTitle:(NSString *)title  {
 
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundColor = [UIColor clearColor];
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.layer setBorderWidth:2];
    self.layer.cornerRadius = 15;
    
}


@end
