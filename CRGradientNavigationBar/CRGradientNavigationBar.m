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


- (void)setBarTintGradientColors:(NSArray *)barTintGradientColors
{
    [self setBarTintGradientColors:barTintGradientColors duration:0];
}


- (void)setBarTintGradientColors:(NSArray *)barTintGradientColors  duration:(CFTimeInterval)duration
{
    // create the gradient layer
    if (self.gradientLayer == nil) {
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.opacity = self.translucent ? kDefaultOpacity : 1.0f;
    }
    
    NSMutableArray * colors = nil;
    if (barTintGradientColors != nil)
    {
        colors = [NSMutableArray arrayWithCapacity:[barTintGradientColors count]];
        
        // determine elements in the array are colours
        // and add them to the colors array
        [barTintGradientColors enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[UIColor class]])
            {
                // UIColor class
                [colors addObject:(id)[obj CGColor]];
            }
            else if ( CFGetTypeID( (__bridge void *)obj ) == CGColorGetTypeID() )
            {
                // CGColorRef
                [colors addObject:obj];
            }
            else
            {
                // obj is not a supported type
                @throw [NSException exceptionWithName:@"BarTintGraidentColorsError" reason:@"object in barTintGradientColors array is not a UIColor or CGColorRef" userInfo:nil];
            }
        }];
        
        // make it possible for the graident to be seen for iOS 6 and iOS 7
        if ( [self respondsToSelector:@selector(setBarTintColor:)] )
        {
            // iOS 7
            self.barTintColor = [UIColor clearColor];
        }
        else
        {
            // iOS 6
            self.tintColor = [UIColor clearColor];
            // stops the gradient on iOS 6 UINavigationBar
            [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        }
    }
    
    // setting animation
    // seems like animation is inevitable, even you set duration to 0
    [self.gradientLayer removeAnimationForKey:@"gradient"];
    
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.timingFunction = [CAMediaTimingFunction
                                 functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.gradientLayer addAnimation:transition forKey:@"gradient"];
    
    // set the graident colours to the laery
    self.gradientLayer.colors = colors;
}

- (void)setBarTintGradientRotation:(CGFloat)rotationDegree
{
    [self setBarTintGradientRotation:rotationDegree duration:1];
}

- (void)setBarTintGradientRotation:(CGFloat)rotationDegree  duration:(CFTimeInterval)duration
{
    float radians = (rotationDegree / 180.0) * M_PI;
    [self.gradientLayer removeAnimationForKey:@"rotation"];
    
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.timingFunction = [CAMediaTimingFunction
                                 functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.gradientLayer addAnimation:transition forKey:@"rotation"];
    
    float x = cosf(radians);
    float y = sinf(radians);
    self.gradientLayer.startPoint = CGPointMake(0.5-x*0.5, 0.5-y*0.5);
    self.gradientLayer.endPoint = CGPointMake(0.5+x*0.5, 0.5+y*0.5);
}

#pragma mark - helpers


-(NSArray*)colorGradientArrayFromColor:(UIColor*)c1  toColor:(UIColor*)c2
{
    return [NSArray arrayWithObjects:(id)c1.CGColor, (id)c2.CGColor, nil];
}


#pragma mark - UIView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // allow all layout subviews call to adjust the frame
    if ( self.gradientLayer != nil )
    {
        if ( floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1 )
        {
             // iOS 7
            CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
            self.gradientLayer.frame = CGRectMake(0, 0 - statusBarHeight, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + statusBarHeight);
        }
        else
        {
            // iOS 6
            self.gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
        }
        
        // make sure the graident layer is at position 1
        [self.layer insertSublayer:self.gradientLayer atIndex:1];
    }
}

@end
