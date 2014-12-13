//
//  SidesVC.m
//  BurgerSample
//
//  Created by Parker Lewis on 11/24/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "SidesVC.h"
#import "CheckListCell.h"

@interface SidesVC ()


@property (strong, nonatomic) NSArray *listOfSides;
@property (strong, nonatomic) NSArray *sidesImages;

@property (strong, nonatomic) UILabel *chooseYourSidesLabel;

@property (strong, nonatomic) NSMutableArray *chosenSides;


@end

@implementation SidesVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.listOfSides = @[@"French Fries", @"Onion Rings", @"Nuggets", @"Milkshake", @"Drink"];
    self.sidesImages = @[[UIImage imageNamed:@"fries"], [UIImage imageNamed:@"onionRings"], [UIImage imageNamed:@"nuggets"], [UIImage imageNamed:@"milkshake"], [UIImage imageNamed:@"drinks"]];

    
    // Make Sides label
    self.chooseYourSidesLabel = [[[UILabel alloc] init] autorelease];
    self.chooseYourSidesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.chooseYourSidesLabel.text = @"Choose your sides";
    self.chooseYourSidesLabel.backgroundColor = [UIColor clearColor];
    self.chooseYourSidesLabel.font = [UIFont boldSystemFontOfSize:20];
    self.chooseYourSidesLabel.textColor = [UIColor blackColor];
    self.chooseYourSidesLabel.layer.cornerRadius = 15;
    self.chooseYourSidesLabel.layer.borderColor = [[UIColor blackColor] CGColor];
    self.chooseYourSidesLabel.layer.borderWidth = 2;
    self.chooseYourSidesLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.chooseYourSidesLabel];

    
    // make tableview
    self.sidesTableView = [[[UITableView alloc] init] autorelease];
    self.sidesTableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.sidesTableView.delegate = self;
    self.sidesTableView.dataSource = self;
    self.sidesTableView.scrollEnabled = NO;
    self.sidesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.sidesTableView.backgroundColor = self.themeColor;
    [self.view addSubview:self.sidesTableView];

    [self setupConstraints];

    self.chosenSides = [[[NSMutableArray alloc] init] autorelease];
}


-(void) setupConstraints {
    NSDictionary *viewsDictionary = @{@"chooseYourSidesLabel": self.chooseYourSidesLabel,
                                      @"sidesTableView": self.sidesTableView};
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[chooseYourSidesLabel(50)]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-30-[chooseYourSidesLabel]"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: self.chooseYourSidesLabel
                                                          attribute: NSLayoutAttributeCenterX
                                                          relatedBy: NSLayoutRelationEqual
                                                             toItem: self.view
                                                          attribute: NSLayoutAttributeCenterX
                                                         multiplier: 1
                                                           constant: 0]
     ];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-0-[sidesTableView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
    
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:[chooseYourSidesLabel]-20-[sidesTableView]-70-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:viewsDictionary]];
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CheckListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [[CheckListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.checkboxImage.image = [UIImage imageNamed:@"uncheckedBox"];
    cell.itemLabel.text = self.listOfSides[indexPath.row];
    cell.backgroundColor = self.view.backgroundColor;
    cell.itemImage.image = self.sidesImages[indexPath.row];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.listOfSides.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return self.sidesTableView.frame.size.height / [self.listOfSides count];
    return (self.sidesTableView.frame.size.height / [self.listOfSides count]) < 100 ? self.sidesTableView.frame.size.height / [self.listOfSides count] : 100;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CheckListCell *currentCell = (CheckListCell*) [self.sidesTableView cellForRowAtIndexPath:indexPath];
    if (!currentCell.isChecked) {
        currentCell.checkboxImage.image = [UIImage imageNamed:@"checkedBox"];
        [self.chosenSides addObject:self.listOfSides[indexPath.row]];
        currentCell.isChecked = YES;
    } else {
        currentCell.checkboxImage.image = [UIImage imageNamed:@"uncheckedBox"];
        [self.chosenSides removeObject:self.listOfSides[indexPath.row]];
        currentCell.isChecked = NO;
    }

    
    NSNotification *newSidesNotification = [[[NSNotification alloc] initWithName:@"NEW_SIDES" object:self.chosenSides userInfo:nil] autorelease];
    [[NSNotificationCenter defaultCenter] postNotification:newSidesNotification];
}


@end
