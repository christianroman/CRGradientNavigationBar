CRGradientNavigationBar
=======================
Custom `UINavigationBar` subclass which allows gradient coloured navigation bar on iOS 6/7.

![CRGradientNavigationBar-main](http://chroman.me/wp-content/uploads/2013/10/main.png)

Usage
-----

 1. Add the dependency to your Podfile:
```ruby
platform :ios
pod 'CRGradientNavigationBar'
...
```

 1. Run `pod install` to install the dependencies.

 1. Import the header file wherever you want to use the gradient colored navigation bar:
```objc
#import "CRGradientNavigationBar.h"
```

 1. Use with UINavigationController's `initWithNavigationBarClass:toolbarClass:` method:
```objc
UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[CRGradientNavigationBar class] toolbarClass:nil];
```

 1. Use an `NSArray` to set the gradient colors (You can set unlimited colors):
```objc
UIColor *firstColor = [UIColor colorWithRed:255.0f/255.0f green:42.0f/255.0f blue:104.0f/255.0f alpha:1.0f];
UIColor *secondColor = [UIColor colorWithRed:255.0f/255.0f green:90.0f/255.0f blue:58.0f/255.0f alpha:1.0f];
NSArray *colors = [NSArray arrayWithObjects:firstColor, secondColor, nil];
```

 1. Set the gradient colors via NSArray using UIAppearance `setBarTintGradientColors:` method:
```objc
[[CRGradientNavigationBar appearance] setBarTintGradientColors:colors];
```

 1. Remember to set (**YES**) or not (**NO**) to translucent value using `setTranslucent:` method:
```objc
[[navigationController navigationBar] setTranslucent:NO];
```

You can change the transparency default value (**0.5f**), just change this line in the `CRGradientNavigationBar.m` file:
```objc
static CGFloat const kDefaultOpacity = 0.5f;
```

**Full example:**
```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[CRGradientNavigationBar class] toolbarClass:nil];
    
    UIColor *firstColor = [UIColor colorWithRed:255.0f/255.0f green:42.0f/255.0f blue:104.0f/255.0f alpha:1.0f];
    UIColor *secondColor = [UIColor colorWithRed:255.0f/255.0f green:90.0f/255.0f blue:58.0f/255.0f alpha:1.0f];
    
    NSArray *colors = [NSArray arrayWithObjects:firstColor, secondColor, nil];
    // or NSArray *colors = [NSArray arrayWithObjects:(id)UIColorFromRGB(0xf16149).CGColor, (id)UIColorFromRGB(0xf14959).CGColor, nil];
    
    [[CRGradientNavigationBar appearance] setBarTintGradientColors:colors];
    [[navigationController navigationBar] setTranslucent:NO]; // Remember, the default value is YES.
    
    DemoViewController *viewController = [[DemoViewController alloc] init];
    [navigationController setViewControllers:@[viewController]];
    
    [self.window setRootViewController:navigationController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
```

Example gradient combinations
----------

* Translucent = **NO**

![CRGradientNavigationBar-sample1](http://chroman.me/wp-content/uploads/2013/10/CRGradientNavigationBar-sample1.png)

![CRGradientNavigationBar-sample2](http://chroman.me/wp-content/uploads/2013/10/CRGradientNavigationBar-sample2.png)

* Translucent = **YES**

![CRGradientNavigationBar-sample3](http://chroman.me/wp-content/uploads/2013/10/CRGradientNavigationBar-sample3.png)

* Example using three different colors and translucent` value to **NO**

![CRGradientNavigationBar-combination](http://chroman.me/wp-content/uploads/2013/10/CRGradientNavigationBar-combination.png)

* If you need just **one** color use UIAppearance `setBarTintColor:` method:

```objc
[[CRGradientNavigationBar appearance] setBarTintColor:UIColorFromRGB(0xEE695D)];
```

![CRGradientNavigationBar-simple](http://chroman.me/wp-content/uploads/2013/10/simple.png)

Translucent demo 1:

![CRGradientNavigationBar-demo1](http://chroman.me/wp-content/uploads/2013/10/CRGradientNavigationBar-demo1.gif)

Translucent demo 2:

![CRGradientNavigationBar-demo1](http://chroman.me/wp-content/uploads/2013/10/CRGradientNavigationBar-demo2.gif)


Requirements
----------
* iOS 6.0 or higher
* ARC

## License
CRGradientNavigationBar is released under the MIT license. See
[LICENSE](https://github.com/chroman/CRGradientNavigationBar/blob/master/LICENSE).

Contact me
----------

**Christian Roman**  
  
Website: [http://chroman.me][1]

Contact: [chroman16@gmail.com][2]

Twitter: [http://twitter.com/chroman][3] 

  [1]: http://chroman.me
  [2]: mailto:chroman16@gmail.com
  [3]: http://twitter.com/chroman