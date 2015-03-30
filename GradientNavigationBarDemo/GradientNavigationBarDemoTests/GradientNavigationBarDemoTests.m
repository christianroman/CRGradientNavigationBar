//
//  GradientNavigationBarDemoTests.m
//  GradientNavigationBarDemoTests
//
//  Created by Christian Roman on 20/10/13.
//  Copyright (c) 2013 Christian Roman. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface GradientNavigationBarDemoTests : XCTestCase

@end

@implementation GradientNavigationBarDemoTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

#define degreesToRadians(angleDegrees) (angleDegrees * M_PI / 180.0)
#define radiansToDegrees(angleRadians) (angleRadians * 180.0 / M_PI)
#define SWAP(x, y) do { typeof(x) SWAP = x; x = y; y = SWAP; } while (0)

- (void)testNormalizeAngle
{
    
    for (int i = 0; i < 720; i = i + 5)
    {
        [self printCoordinates:i];
    }
    
    
}

- (void)printCoordinates:(double)angle
{
    
    angle = constrainAngle(angle);
    
    double rad = degreesToRadians(angle);
    
    double xa, ya, xb, yb;
    
    for (int N = 0; N < 2; N++)
    {
        if ((-M_PI_4+M_PI*N) <= rad && rad < (M_PI_4+M_PI*N))
        {
            xa = 0;
            xb = 1;
            ya = (1 - tan(rad))/2;
            yb = 1 - ya;
            
            if (N > 0) {
                SWAP(xa, xb);
                SWAP(ya, yb);
            }
           
            NSLog(@"First condition %d, (%f, %f) (%f, %f)", (int)angle, xa, ya, xb, yb);
            
            break;
        }
        else if ((M_PI_4+M_PI*N) <= rad && rad < (M_PI_4*3+M_PI*N))
        {
            yb = 1;
            ya = 0;
            
            // xb > xa
            xb = (1/tan(rad) + 1)/2;
            
            if (N > 0)
            {
                // xb<xa
                xb = (1 - 1/tan(rad))/2;
                SWAP(ya, yb);
            }
            
            xa = 1 - xb;

            NSLog(@"Second condition %d, (%f, %f) (%f, %f)", (int)angle, xa, ya, xb, yb);
            
            break;
        }
    }
    
}


double constrainAngle(double x) {
    x = fmod(x, 360);
    if (x < 0)
        x += 360;
    return x;
}

@end
