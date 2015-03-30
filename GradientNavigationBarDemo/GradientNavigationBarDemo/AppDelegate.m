//
//  AppDelegate.m
//  GradientNavigationBarDemo
//
//  Created by Christian Roman on 19/10/13.
//  Copyright (c) 2013 Christian Roman. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoViewController.h"
#import "CRGradientNavigationBar.h"

#define UIColorFromRGB(rgbValue)[UIColor colorWithRed:((float)((rgbValue&0xFF0000)>>16))/255.0 green:((float)((rgbValue&0xFF00)>>8))/255.0 blue:((float)(rgbValue&0xFF))/255.0 alpha:1.0]

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[CRGradientNavigationBar class] toolbarClass:nil];
//    
//    UIColor *firstColor = [UIColor colorWithRed:255.0f/255.0f green:42.0f/255.0f blue:104.0f/255.0f alpha:1.0f];
//    UIColor *secondColor = [UIColor colorWithRed:255.0f/255.0f green:90.0f/255.0f blue:58.0f/255.0f alpha:1.0f];
//    
//    NSArray *colors = [NSArray arrayWithObjects:(id)firstColor.CGColor, (id)secondColor.CGColor, nil];
    NSArray *colors = [NSArray arrayWithObjects:(id)UIColorFromRGB(0x0000ff).CGColor, (id)UIColorFromRGB(0xff0000).CGColor, nil];
    
    [[CRGradientNavigationBar appearance] setBarTintGradientColors:colors];
    
    [[CRGradientNavigationBar appearance] setGradientAngle:30];
    
    [[navigationController navigationBar] setTranslucent:NO]; // Remember, the default value is YES.
    
    DemoViewController *viewController = [[DemoViewController alloc] init];
    [navigationController setViewControllers:@[viewController]];
    
    [self.window setRootViewController:navigationController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
