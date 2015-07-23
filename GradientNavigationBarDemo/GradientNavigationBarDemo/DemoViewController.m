//
//  DemoViewController.m
//  GradientNavigationBarDemo
//
//  Created by Christian Roman on 19/10/13.
//  Copyright (c) 2013 Christian Roman. All rights reserved.
//

#import "DemoViewController.h"
#import "CRGradientNavigationBar.h"

@interface DemoViewController ()

@property (nonatomic, strong) NSArray *items;

@end

@implementation DemoViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Demo";

    self.items = @[
                  @"Green (Fastest)",
                  @"Blue (Fast)",
                  @"Orange (Slow)",
                  @"Random rotation",
                  @"Always put your fears behind you and your dreams in front of you.",
                  @"A relationship with no trust is like a cell phone with no service, all you can do is play games.",
                  @"People should stop talking about their problem and start thinking about the solution.",
                  @"Dear Chuck Norris, Screw you. I can grill burgers under water. Sincerely, Spongebob Squarepants.",
                  @"My arms will always be open for you, they will never close, not unless you're in them.",
                  @"Always put your fears behind you and your dreams in front of you.",
                  @"A relationship with no trust is like a cell phone with no service, all you can do is play games.",
                  @"People should stop talking about their problem and start thinking about the solution.",
                  @"Dear Chuck Norris, Screw you. I can grill burgers under water. Sincerely, Spongebob Squarepants.",
                  @"My arms will always be open for you, they will never close, not unless you're in them.",
                  ];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.numberOfLines = 0;
    }
    
    NSString *string = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = string;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    // Selecting first three lines test color changes and animation speeds
    CRGradientNavigationBar *gradientNavBar = (CRGradientNavigationBar*)self.navigationController.navigationBar;
    
    NSArray *colors;
    if ([indexPath indexAtPosition:1] == 0) {
        colors = @[
                   [UIColor colorWithRed:0.42 green:0.776 blue:0.231 alpha:1],
                   [UIColor colorWithRed:0.333 green:0.741 blue:0.243 alpha:1]
                   ];
        [gradientNavBar setBarTintGradientColors:colors duration:0];
    } else if ([indexPath indexAtPosition:1] == 1) {
        colors = @[
                   [UIColor colorWithRed:0.043 green:0.486 blue:0.757 alpha:1],
                   [UIColor colorWithRed:0.145 green:0.251 blue:0.596 alpha:1]
                   ];
        [gradientNavBar setBarTintGradientColors:colors duration:.6];
    } else if ([indexPath indexAtPosition:1] == 2) {
        colors = @[
                   [UIColor colorWithRed:0.992 green:0.675 blue:0.341 alpha:1],
                   [UIColor colorWithRed:0.98 green:0.525 blue:0.341 alpha:1]
                   ];
        [gradientNavBar setBarTintGradientColors:colors duration:1];
    } else if ([indexPath indexAtPosition:1] == 3) {
        
        colors = @[
                   [UIColor colorWithRed:0 green:0 blue:0 alpha:1],
                   [UIColor colorWithRed:1 green:1 blue:1 alpha:1]
                   ];
        [gradientNavBar setBarTintGradientColors:colors];
        
        [gradientNavBar setBarTintGradientRotation:arc4random_uniform(360) duration:0.1];
    }
}

@end
