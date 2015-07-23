//
//  CRGradientNavigationBar.h
//  CRGradientNavigationBar
//
//  Created by Christian Roman on 19/10/13.
//  Copyright (c) 2013 Christian Roman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRGradientNavigationBar : UINavigationBar

- (void)setBarTintGradientColors:(NSArray *)barTintGradientColors;
- (void)setBarTintGradientColors:(NSArray *)barTintGradientColors  duration:(CFTimeInterval)duration;

- (NSArray*)colorGradientArrayFromColor:(UIColor*)c1  toColor:(UIColor*)c2;

- (void)setBarTintGradientRotation:(CGFloat)rotationDegree;
- (void)setBarTintGradientRotation:(CGFloat)rotationDegree  duration:(CFTimeInterval)duration;

@end
