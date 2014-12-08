//
//  MenuCell.m
//  BurgerSample
//
//  Created by Parker Lewis on 11/24/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

//@synthesize menuLabel = _menuLabel;



// TODO: Do my two labels and imageview get shown in place of the default cell.textLabel, cell.detailTextLabel, and cell.imageView?
//

-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        // Section label
        self.menuLabel = [[[UILabel alloc] init] autorelease];
        self.menuLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.menuLabel.textColor = [UIColor blackColor];
        self.menuLabel.font = [UIFont boldSystemFontOfSize:30];
        self.menuLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.menuLabel];


        // Image
        self.menuCellImage = [[[UIImageView alloc] init] autorelease];
        self.menuCellImage.translatesAutoresizingMaskIntoConstraints = NO;
        self.menuCellImage.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.menuCellImage];

        // subliminal message label
        self.subliminalMessageLabel = [[[UILabel alloc] init] autorelease];
        self.subliminalMessageLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.subliminalMessageLabel.textColor = [UIColor blackColor];
        self.subliminalMessageLabel.font = [UIFont boldSystemFontOfSize:14];
        self.subliminalMessageLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:self.subliminalMessageLabel];

        
        NSDictionary *viewsDictionary = @{@"menuLabel": self.menuLabel,
                                          @"menuCellImage": self.menuCellImage,
                                          @"subliminalMessageLabel": self.subliminalMessageLabel};
        
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:@"H:[subliminalMessageLabel]-20-|"
                                          options:NSLayoutFormatDirectionLeadingToTrailing
                                          metrics:nil
                                          views:viewsDictionary]];
        
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:@"V:|-30-[menuLabel]-10-[menuCellImage]"
                                          options:NSLayoutFormatDirectionLeadingToTrailing
                                          metrics:nil
                                          views:viewsDictionary]];
        
        // menuLabel
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.menuLabel
                                                                     attribute: NSLayoutAttributeWidth
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.contentView
                                                                     attribute: NSLayoutAttributeWidth
                                                                    multiplier: 0.50
                                                                      constant: 0]
         ];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.menuLabel
                                                                     attribute: NSLayoutAttributeCenterX
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.contentView
                                                                     attribute: NSLayoutAttributeCenterX
                                                                    multiplier: 0.5
                                                                      constant: 0]
         ];
        

        // menuCellImage
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.menuCellImage
                                                                     attribute: NSLayoutAttributeHeight
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.contentView
                                                                     attribute: NSLayoutAttributeHeight
                                                                    multiplier: 0.6
                                                                      constant: 0]
         ];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.menuCellImage
                                                                     attribute: NSLayoutAttributeWidth
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.menuCellImage
                                                                     attribute: NSLayoutAttributeHeight
                                                                    multiplier: 1
                                                                      constant: 0]
         ];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.menuCellImage
                                                                     attribute: NSLayoutAttributeCenterX
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.contentView
                                                                     attribute: NSLayoutAttributeCenterX
                                                                    multiplier: 0.5
                                                                      constant: 0]
         ];
        
        
        // subliminalMessageLabel
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.subliminalMessageLabel
                                                                     attribute: NSLayoutAttributeWidth
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.contentView
                                                                     attribute: NSLayoutAttributeWidth
                                                                    multiplier: 0.45
                                                                      constant: 0]
         ];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.subliminalMessageLabel
                                                                     attribute: NSLayoutAttributeCenterY
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.contentView
                                                                     attribute: NSLayoutAttributeCenterY
                                                                    multiplier: 1
                                                                      constant: 0]
         ];


        
        
        
    }
    
    
    
    return self;
    
}

- (void)dealloc {
    [_menuCellImage release];
    [super dealloc];
}
@end
