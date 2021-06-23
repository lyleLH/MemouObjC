//
//  MTHomeWireframe.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTHomeWireframe.h"
#import "MTHomeViewController.h"

@interface MTHomeWireframe ()

@property (nonatomic, strong) MTHomeViewController *viewController;

@end

@implementation MTHomeWireframe

- (void)presentSelfFromWindow:(UIWindow *)window {
    
    MTHomeViewController *homeVC = [[MTHomeViewController alloc] init];
    homeVC.eventHandler = self.presenter;
    self.presenter.userInterface = homeVC;
    self.viewController = homeVC;
    
    [self.rootWireframe showRootViewController:homeVC
                                      inWindow:window];
    
}


- (void)presentSelfFromViewController:(UIViewController *)viewController
{
    // save reference
    self.viewController = [[MTHomeViewController alloc] initWithNibName:@"MTHomeViewController" bundle:nil];

    // view <-> presenter
    self.presenter.userInterface = self.viewController;
    self.viewController.eventHandler = self.presenter;

    // present controller
    // *** present self with RootViewController
    
 
    
}




@end
