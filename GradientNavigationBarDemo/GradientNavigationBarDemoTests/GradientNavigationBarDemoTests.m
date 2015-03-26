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

- (void)testMath
{
    
    for (int i = 0; i<360; i++)
    {
        [self t:i];
    }
    
    
}

- (void)t:(int)deg
{
    double rad = deg * M_PI / 180;
    
    CGPoint A, B;
    
    
    
    if (rad < M_PI_4)
    {
        A = CGPointMake(0, (1 - tan(rad))/2);
        B = CGPointMake(1, 1 - A.y);
    }
    else if (M_PI_4 <= rad && rad < M_PI_2)
    {
        B = CGPointMake(1/(2 *tan(rad)) + 1/2, 1);
        A = CGPointMake(1 - B.x, 0);
    }
    else if (M_PI_2 <= rad)
    {
        B = CGPointMake(1/(2 *tan(rad)) + 1/2 + 1, 1);
        A = CGPointMake(1 - B.x, 0);
    }
    
    
    
    
    NSLog(@"%d", deg);
    NSLog(@"%@ %@", NSStringFromCGPoint(A), NSStringFromCGPoint(B));
    
    
}

#define degreesToRadians(angleDegrees) (angleDegrees * M_PI / 180.0)
#define radiansToDegrees(angleRadians) (angleRadians * 180.0 / M_PI)
#define SWAP(x, y) do { typeof(x) SWAP = x; x = y; y = SWAP; } while (0)

- (void)testNormalizeAngle
{
    
    
    for (int i = 0; i < 720; i = i + 2)
    {
        [self normalizeAngle:i];
    }
    
    
}

- (void)normalizeAngle:(double)angle
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
//            yb = 1;
//            ya = 0;
//            
//            if (rad > M_PI_2 || N) {
//                xb = 1/2 - 1/(2 *tan(rad));
//            }
//            else
//            {
//                xb = 1/(2 *tan(rad)) + 1/2;
//            }
//            
//            if (N)
//            {
//                SWAP(ya, yb);
//            }
//            
//            xa = 1 - xb;
//            
//            NSLog(@"Second condition %d, (%f, %f) (%f, %f)", (int)angle, xa, ya, xb, yb);
            
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
