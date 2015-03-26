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
@property (nonatomic, strong) NSTimer *timer;

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
    
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(updateGradient:) userInfo:nil repeats:YES];
}

- (void)updateGradient:(NSTimer *)timer
{
    static double angle = 0.f;
    
    CRGradientNavigationBar *bar = (CRGradientNavigationBar *)self.navigationController.navigationBar;
    bar.gradientAngle = angle;
    
    angle+=3.f;
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
}

@end
