CRGradientNavigationBar
=======================
Custom `UINavigationBar` subclass which allows gradient colored bar navigation bars on iOS 7.

![CRGradientNavigationBar-main](http://chroman.me/wp-content/uploads/2013/10/main.png)

Usage
----------

 - Add `CRGradientNavigationBar.m` and `CRGradientNavigationBar.h` files to your XCode Project
 - Use with UINavigationController's `initWithNavigationBarClass:toolbarClass:` method (example):

```objective-c
UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[CRGradientNavigationBar class] toolbarClass:nil];

UIColor *firstColor = [UIColor colorWithRed:255.0f/255.0f green:42.0f/255.0f blue:104.0f/255.0f alpha:1.0f];
UIColor *secondColor = [UIColor colorWithRed:255.0f/255.0f green:90.0f/255.0f blue:58.0f/255.0f alpha:1.0f];

NSArray *colors = [NSArray arrayWithObjects:(id)firstColor.CGColor, (id)secondColor.CGColor, nil];

[[CRGradientNavigationBar appearance] setBarTintGradientColors:colors];
[[navigationController navigationBar] setTranslucent:NO]; // Remember, the default value is YES.

DemoViewController *viewController = [[DemoViewController alloc] init];
[navigationController setViewControllers:@[viewController]];

[self.window setRootViewController:navigationController];
```

- Set the gradient colors via NSArray (You can use n colors) using UIAppearance `setBarTintGradientColors:` method:
```objective-c
[[CRGradientNavigationBar appearance] setBarTintGradientColors:colors];
```

- Remember to set (YES) or not (NO) to translucent value using `setTranslucent:` method:
```objective-c
[[navigationController navigationBar] setTranslucent:NO];
```

- You can change the transparency default value (0.5f), just change this line in the `CRGradientNavigationBar.m` file:
```objective-c
static CGFloat const kDefaultOpacity = 0.5f;
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

```objective-c
[[CRGradientNavigationBar appearance] setBarTintColor:UIColorFromRGB(0xEE695D)];
```

![CRGradientNavigationBar-simple](http://chroman.me/wp-content/uploads/2013/10/simple.png)

Translucent demo 1:

![CRGradientNavigationBar-demo1](http://chroman.me/wp-content/uploads/2013/10/CRGradientNavigationBar-demo1.gif)

Translucent demo 2:

![CRGradientNavigationBar-demo1](http://chroman.me/wp-content/uploads/2013/10/CRGradientNavigationBar-demo2.gif)


Requirements
----------
* iOS 7.0 or higher
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