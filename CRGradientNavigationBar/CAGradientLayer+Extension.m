//
//  CAGradientLayer+Extension.m
//  GradientNavigationBarDemo
//
//  Created by Sergey Popov on 30.03.15.
//  Copyright (c) 2015 Sergey Popov. All rights reserved.
//

#import "CAGradientLayer+Extension.h"
#import <objc/runtime.h>

#define SWAP(x, y) do { typeof(x) SWAP = x; x = y; y = SWAP; } while (0)

@implementation CAGradientLayer (Extension)

static void *CAGradientLayerGradientAnglePropertyKey;

- (void)setGradientAngle:(CGFloat)gradientAngle
{
    gradientAngle = fmod(gradientAngle, 360);
    if (gradientAngle < 0)
        gradientAngle += 360;
    
    CGFloat rad = gradientAngle * M_PI / 180.f;
    
    CGFloat xa =0, ya=0, xb=0, yb=0;
    
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
    
    self.startPoint = CGPointMake(xa, ya);
    self.endPoint = CGPointMake(xb, yb);
    
    objc_setAssociatedObject(self, CAGradientLayerGradientAnglePropertyKey, @(gradientAngle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)gradientAngle
{
    return [objc_getAssociatedObject(self, CAGradientLayerGradientAnglePropertyKey) doubleValue];
}

@end
