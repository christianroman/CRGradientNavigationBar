//
//  CRGradientNavigationBar.m
//  CRGradientNavigationBar
//
//  Created by Christian Roman on 19/10/13.
//  Copyright (c) 2013 Christian Roman. All rights reserved.
//

#import "CRGradientNavigationBar.h"

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
    
    // I'm not sure if this is the better place to clear barTintColor to support translucent.
    self.barTintColor = [UIColor clearColor];
    self.gradientLayer.colors = barTintGradientColors;
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
