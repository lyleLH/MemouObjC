//
//  MemouAppDelegate.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MemouAppDelegate.h"
#import "MemouAppDependencies.h"
#import "MemouConfig.h"

@interface MemouAppDelegate ()

@property (nonatomic, strong) MemouAppDependencies *dependencies;

@end

@implementation MemouAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // initialize window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];

    // initialize dependencies
    MemouAppDependencies *dependencies = [[MemouAppDependencies alloc] init];
    self.dependencies = dependencies;

    // adding RootViewController
    [self.dependencies installRootViewControllerIntoWindow:self.window];

    [_window makeKeyAndVisible];

    return YES;
}

@end
