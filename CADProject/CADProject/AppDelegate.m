//
//  AppDelegate.m
//  CADProject
//
//  Created by Jacy on 2023/2/23.
//

#import "AppDelegate.h"
#import "CADGuideViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] init];
    [UIApplication sharedApplication].delegate.window = self.window;
    self.window.frame = [UIScreen mainScreen].bounds;
    CADGuideViewController *vc = [[CADGuideViewController alloc] init];
    JZNavigationController *nav = [[JZNavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController=nav;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}



@end
