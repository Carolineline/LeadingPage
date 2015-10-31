//
//  AppDelegate.m
//  LeadingPage
//
//  Created by 晓琳 on 15/10/31.
//  Copyright © 2015年 晓琳. All rights reserved.
//

#import "AppDelegate.h"
#import "HXLLeadingPageViewController.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString * userHasOnboared = [[NSUserDefaults standardUserDefaults] objectForKey:@"user"];
    
    //引导页判断是否第一次进入app
    
    if ([userHasOnboared isEqualToString:@"yes"]) {
        

        [self viewController];
        
    }else {
        [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:@"user"];
        
        HXLLeadingPageViewController *leadPageVC = [[HXLLeadingPageViewController alloc] initWithArray:@[@"Landingpage6.png",@"Landingpage3.png",@"Landingpage5.png"] andAction:^{
            [self viewController];
        }];
        self.window.rootViewController = leadPageVC;
        
        
    }
    
    application.statusBarStyle = UIStatusBarStyleLightContent;
    //
    [self.window makeKeyAndVisible];
    
    return YES;
}


-(void) viewController
{
    ViewController *viewC = [[ViewController alloc] init];
    UINavigationController *naVC = [[UINavigationController alloc] initWithRootViewController:viewC];
    viewC.view.backgroundColor = [UIColor yellowColor];
    self.window.rootViewController = naVC;
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
