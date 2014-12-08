//
//  CheckListCell.m
//  BurgerSample
//
//  Created by Parker Lewis on 12/2/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "CheckListCell.h"

@implementation CheckListCell


-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.isChecked = NO;
        
        // Item label
        self.itemLabel = [[[UILabel alloc] init] autorelease];
        self.itemLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.itemLabel.textColor = [UIColor blackColor];
        self.itemLabel.numberOfLines = 1;
        self.itemLabel.minimumScaleFactor = 20;
        self.itemLabel.adjustsFontSizeToFitWidth = YES;
        self.itemLabel.textAlignment = NSTextAlignmentCenter;
        self.itemLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.itemLabel];
        
        
        // Image
        self.itemImage = [[[UIImageView alloc] init] autorelease];
        self.itemImage.translatesAutoresizingMaskIntoConstraints = NO;
        self.itemImage.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.itemImage];
        
        // checkbox Image
        self.checkboxImage = [[[UIImageView alloc] init] autorelease];
        self.checkboxImage.translatesAutoresizingMaskIntoConstraints = NO;
//        self.checkboxImage.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.checkboxImage];
        
        
        NSDictionary *viewsDictionary = @{@"itemLabel": self.itemLabel,
                                          @"itemImage": self.itemImage,
                                          @"checkboxImage": self.checkboxImage};
        
        [self.contentView addConstraints:[NSLayoutConstraint
                                          constraintsWithVisualFormat:@"H:|-20-[itemImage]-10-[itemLabel]-10-[checkboxImage]-10-|"
                                          options:NSLayoutFormatDirectionLeadingToTrailing
                                          metrics:nil
                                          views:viewsDictionary]];
        
//        [self.contentView addConstraints:[NSLayoutConstraint
//                                          constraintsWithVisualFormat:@"H:[checkboxImage]-20-|"
//                                          options:NSLayoutFormatDirectionLeadingToTrailing
//                                          metrics:nil
//                                          views:viewsDictionary]];
        
        
//        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.itemLabel
//                                                                     attribute: NSLayoutAttributeWidth
//                                                                     relatedBy: NSLayoutRelationEqual
//                                                                        toItem: self.contentView
//                                                                     attribute: NSLayoutAttributeWidth
//                                                                    multiplier: 0.50
//                                                                      constant: 0]
//         ];
        
        // center on Y
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.itemImage
                                                                     attribute: NSLayoutAttributeCenterY
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.contentView
                                                                     attribute: NSLayoutAttributeCenterY
                                                                    multiplier: 1
                                                                      constant: 0]
         ];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.itemLabel
                                                                     attribute: NSLayoutAttributeCenterY
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.contentView
                                                                     attribute: NSLayoutAttributeCenterY
                                                                    multiplier: 1
                                                                      constant: 0]
         ];
        
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.checkboxImage
                                                                     attribute: NSLayoutAttributeCenterY
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.contentView
                                                                     attribute: NSLayoutAttributeCenterY
                                                                    multiplier: 1
                                                                      constant: 0]
         ];
        
        
        // itemImage
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.itemImage
                                                                     attribute: NSLayoutAttributeHeight
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.contentView
                                                                     attribute: NSLayoutAttributeHeight
                                                                    multiplier: 0.85
                                                                      constant: 0]
         ];
        
        // 1 to 1 ratio
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.itemImage
                                                                     attribute: NSLayoutAttributeWidth
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.itemImage
                                                                     attribute: NSLayoutAttributeHeight
                                                                    multiplier: 1
                                                                      constant: 0]
         ];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.checkboxImage
                                                                     attribute: NSLayoutAttributeWidth
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.checkboxImage
                                                                     attribute: NSLayoutAttributeHeight
                                                                    multiplier: 1
                                                                      constant: 0]
         ];
        
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.checkboxImage
                                                                     attribute: NSLayoutAttributeHeight
                                                                     relatedBy: NSLayoutRelationEqual
                                                                        toItem: self.contentView
                                                                     attribute: NSLayoutAttributeHeight
                                                                    multiplier: 0.9
                                                                      constant: 0]
         ];
        
        
//        // subliminalMessageLabel
//        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.subliminalMessageLabel
//                                                                     attribute: NSLayoutAttributeWidth
//                                                                     relatedBy: NSLayoutRelationEqual
//                                                                        toItem: self.contentView
//                                                                     attribute: NSLayoutAttributeWidth
//                                                                    multiplier: 0.45
//                                                                      constant: 0]
//         ];
//        
//        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem: self.subliminalMessageLabel
//                                                                     attribute: NSLayoutAttributeCenterY
//                                                                     relatedBy: NSLayoutRelationEqual
//                                                                        toItem: self.contentView
//                                                                     attribute: NSLayoutAttributeCenterY
//                                                                    multiplier: 1
//                                                                      constant: 0]
//         ];
        
        
        
        
        
    }
    
    
    
    return self;
    
}

- (void)dealloc {
    [_itemImage release];
    [super dealloc];
}

@end
