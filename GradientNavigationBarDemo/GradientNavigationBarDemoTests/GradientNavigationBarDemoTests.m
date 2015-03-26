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

#define constraint1(N) (- M_PI_4 + M_PI_2 * N)
#define constraint2(N) (M_PI_4+M_PI_2*N)
#define constraint3(N) (M_PI_2+M_PI_4+M_PI_2*N)

- (void)testNormalizeAngle
{
    
    
    for (int i = 0; i < 720; i++)
    {
        [self normalizeAngle:i];
    }
    
    
}

- (void)normalizeAngle:(double)angle
{
    
    angle = constrainAngle(angle);
    
    double rad = degreesToRadians(angle);
    
    
    for (int N = 0; N < 3; N++)
    {
        if ((-M_PI_4+M_PI*N) <= rad && rad < (M_PI_4+M_PI*N))
        {
            NSLog(@"Firs condition %f",angle);
            break;
        }
        else if ((M_PI_4+M_PI*N) <= rad && rad < (M_PI_4*3+M_PI*N))
        {
            NSLog(@"Second condition %f",angle);
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
