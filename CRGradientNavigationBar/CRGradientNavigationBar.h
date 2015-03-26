//
//  CRGradientNavigationBar.h
//  CRGradientNavigationBar
//
//  Created by Christian Roman on 19/10/13.
//  Copyright (c) 2013 Christian Roman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRGradientNavigationBar : UINavigationBar

/*!
 Opacity of navigation bar. Default is 0.5.
 */
@property (nonatomic, assign) CGFloat opacity;

/*!
 The array of UIColors or CGColors
 */
@property (nonatomic, strong) NSArray *barTintGradientColors;

/*!
 Angle for the gradient. Angle of gradient direction in degrees.
 */
@property (nonatomic, assign) CGFloat gradientAngle;

@end
