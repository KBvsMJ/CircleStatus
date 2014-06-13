//
//  CSExampleView.m
//  CircleStatus
//
//  Created by Natalia Osiecka on 11.6.2014.
//  Copyright (c) 2014 AppUnite. All rights reserved.
//

#import "CSExampleView.h"

@implementation CSExampleView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        [self setBackgroundColor:[UIColor yellowColor]];
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self.bounds;
        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor orangeColor] CGColor], (id)[[UIColor yellowColor] CGColor], nil];
        [self.layer insertSublayer:gradient atIndex:0];

        
        _csView = [[CSView alloc] init];
        [_csView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_csView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect bounds = self.bounds;
    CGSize csSize = CGSizeMake(CGRectGetWidth(bounds) - 20.f, 100.f); // chart size
    csSize.height = [_csView.legendView heightForChartSize:csSize]; // chart size with legendView
    
    [_csView setFrame:CGRectIntegral(CGRectMake(CGRectGetMidX(bounds) - (csSize.width / 2), CGRectGetMidY(bounds) - (csSize.height / 2), csSize.width, csSize.height))];
}

@end
