//
//  CRGradientNavigationBar.m
//  CRGradientNavigationBar
//
//  Created by Christian Roman on 19/10/13.
//  Copyright (c) 2013 Christian Roman. All rights reserved.
//

#import "CRGradientNavigationBar.h"
#import <QuartzCore/QuartzCore.h>

#define degreesToRadians(angleDegrees) (angleDegrees * M_PI / 180.0)
#define radiansToDegrees(angleRadians) (angleRadians * 180.0 / M_PI)
#define SWAP(x, y) do { typeof(x) SWAP = x; x = y; y = SWAP; } while (0)


@interface CRGradientNavigationBar ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation CRGradientNavigationBar

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        [self performInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self performInit];
    }
    return self;
}

#pragma mark - Properties

- (void)setOpacity:(CGFloat)opacity
{
    self.gradientLayer.opacity = self.translucent ? opacity : 1.0f;
    _opacity = opacity;
}

- (void)setTranslucent:(BOOL)translucent
{
    [super setTranslucent:translucent];
    self.opacity = _opacity;
}

- (void)setBarTintGradientColors:(NSArray *)barTintGradientColors
{
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
    
    // set the graident colours to the laery
    self.gradientLayer.colors = colors;
    _barTintGradientColors = barTintGradientColors;
}

- (void)setGradientAngle:(CGFloat)gradientAngle
{
    gradientAngle = fmod(gradientAngle, 360);
    if (gradientAngle < 0)
        gradientAngle += 360;
    
    double rad = degreesToRadians(gradientAngle);
    double xa =0, ya=0, xb=0, yb=0;
    
    for (int n = 0; n < 4; n++)
    {
        if ((-M_PI_4+M_PI*n) <= rad && rad < (M_PI_4+M_PI*n))
        {
            xa = 0;
            xb = 1;
            ya = (1 - tan(rad))/2;
            yb = 1 - ya;
            
            if (n % 2) {
                SWAP(xa, xb);
                SWAP(ya, yb);
            }
            
            break;
        }
        else if ((M_PI_4+M_PI*n) <= rad && rad < (M_PI_4*3+M_PI*n))
        {
            yb = 1;
            ya = 0;
            
            // xb > xa
            xb = (1/tan(rad) + 1)/2;
            
            if (n > 0)
            {
                // xb<xa
                xb = (1 - 1/tan(rad))/2;
                SWAP(ya, yb);
            }
            
            xa = 1 - xb;
            
            break;
        }
    }
    
    self.gradientLayer.startPoint = CGPointMake(xa, ya);
    self.gradientLayer.endPoint = CGPointMake(xb, yb);

    _gradientAngle = gradientAngle;
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

#pragma mark - Private

- (void)performInit
{
    _gradientLayer = [CAGradientLayer layer];
    self.opacity = .5f;
}

@end
