//
//  MTRootWireframe.m
//  Memou
//
//  Created by Tom on 2021/6/19.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTRootWireframe.h"

@implementation MTRootWireframe
- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window
{
    UINavigationController *navigationController = [self navigationControllerFromWindow:window];
    navigationController.viewControllers = @[viewController];
   
}


- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window
{
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
    if(!navigationController){
        navigationController = [[UINavigationController alloc] init];
        window.rootViewController = navigationController;
    }
    return navigationController;
}
@end
