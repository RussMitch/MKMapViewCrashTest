//
//  AppDelegate.m
//  MKMapViewCrashTest
//
//------------------------------------------------------------------------------

#import "AppDelegate.h"
#import "TestViewController.h"

@implementation AppDelegate

//------------------------------------------------------------------------------
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//------------------------------------------------------------------------------
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    TestViewController *testViewController = [[TestViewController alloc] init];
    
    if ([testViewController respondsToSelector:@selector( setExtendedLayoutIncludesOpaqueBars: )]) {
        testViewController.extendedLayoutIncludesOpaqueBars= NO;
        testViewController.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    UINavigationController *navigationController= [[UINavigationController alloc] initWithRootViewController:testViewController];

    if ([navigationController respondsToSelector:@selector( setExtendedLayoutIncludesOpaqueBars: )]) {
        navigationController.extendedLayoutIncludesOpaqueBars= NO;
        navigationController.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    navigationController.navigationBar.tintColor= [UIColor blueColor];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
