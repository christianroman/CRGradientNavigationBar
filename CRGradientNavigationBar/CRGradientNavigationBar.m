//
//  CRGradientNavigationBar.m
//  CRGradientNavigationBar
//
//  Created by Christian Roman on 19/10/13.
//  Copyright (c) 2013 Christian Roman. All rights reserved.
//

#import "CRGradientNavigationBar.h"
#import <QuartzCore/QuartzCore.h>

@interface CRGradientNavigationBar ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation CRGradientNavigationBar

static CGFloat const kDefaultOpacity = 0.5f;
static CGFloat const kstatusBarHeight = 20.0f;

- (void)setBarTintGradientColors:(NSArray *)barTintGradientColors
{
    if ([[[UIDevice currentDevice] systemVersion] integerValue] < 7)
        return;
    
    if (self.gradientLayer == nil) {
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.opacity = self.translucent ? kDefaultOpacity : 1.0f;
        [self.layer addSublayer:self.gradientLayer];
    }
    
    NSMutableArray *barTintGradientCGColors = nil;
    if (barTintGradientColors != nil) {
        barTintGradientCGColors = [NSMutableArray arrayWithCapacity:[barTintGradientColors count]];
        for (id color in barTintGradientColors) {
            if ([color isKindOfClass:[UIColor class]]) {
                [barTintGradientCGColors addObject:(id)[color CGColor]];
            } else {
                [barTintGradientCGColors addObject:color];
            }
        }
        self.barTintColor = [UIColor clearColor];
    }
    
    self.gradientLayer.colors = barTintGradientCGColors;
}

#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if ([[[UIDevice currentDevice] systemVersion] integerValue] < 7)
        return;
    
    if (self.gradientLayer != nil) {
        self.gradientLayer.frame = CGRectMake(0, 0 - kstatusBarHeight, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + kstatusBarHeight);
        [self.layer insertSublayer:self.gradientLayer atIndex:1];
    }
}

@end
