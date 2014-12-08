//
//  CheckListCell.h
//  BurgerSample
//
//  Created by Parker Lewis on 12/2/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *itemLabel;
@property (retain, nonatomic) IBOutlet UIImageView *itemImage;
@property (retain, nonatomic) IBOutlet UIImageView *checkboxImage;
@property (assign, nonatomic) BOOL isChecked;

@end
