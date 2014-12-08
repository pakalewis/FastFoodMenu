//
//  UILabel+padding.m
//  BurgerSample
//
//  Created by Parker Lewis on 12/1/14.
//  Copyright (c) 2014 CodeFellows. All rights reserved.
//

#import "UILabel+padding.h"

@implementation UILabel (padding)


-(CGSize)intrinsicContentSize{
    CGSize contentSize = [super intrinsicContentSize];
    return CGSizeMake(contentSize.width + 30, contentSize.height);
}



@end
