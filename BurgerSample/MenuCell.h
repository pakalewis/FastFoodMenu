//
//  MenuCell.h
//  BurgerSample
//
//  Created by Parker Lewis on 11/24/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *menuLabel;
@property (retain, nonatomic) IBOutlet UIImageView *menuCellImage;
@property (strong, nonatomic) IBOutlet UILabel *subliminalMessageLabel;

@end
