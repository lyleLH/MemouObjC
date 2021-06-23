//
//  MTImagePreEditWireframe.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTImagePreEditWireframe.h"
#import "MTImagePreEditViewController.h"

@interface MTImagePreEditWireframe ()

@property (nonatomic, strong) MTImagePreEditViewController *viewController;

@end

@implementation MTImagePreEditWireframe

- (void)presentEditUserInterfaceFromViewController:(UIViewController *)viewController  
{
    // save reference
    self.viewController = [[MTImagePreEditViewController alloc] init];

    // view <-> presenter
    self.presenter.userInterface = self.viewController;
    self.viewController.eventHandler = self.presenter;
    
    // present controller
    // *** present self with RootViewController
    [viewController.navigationController pushViewController:self.viewController animated:YES];
}

@end
