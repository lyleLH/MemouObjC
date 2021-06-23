//
//  MTAlubmPickerWireframe.m
//  MTImagePicker
//
//  Created by MTTGCC on 15/06/21.
//
//

#import "MTAlubmPickerWireframe.h"
#import "MTAlubmPickerViewController.h"

@interface MTAlubmPickerWireframe ()

@property (nonatomic, strong) MTAlubmPickerViewController *viewController;

@end

@implementation MTAlubmPickerWireframe

- (void)presentSelfFromViewController:(UIViewController *)viewController
{
    // save reference
    self.viewController = [[MTAlubmPickerViewController alloc] initWithNibName:@"MTAlubmPickerViewController" bundle:nil];

    // view <-> presenter
    self.presenter.userInterface = self.viewController;
    self.viewController.eventHandler = self.presenter;

    // present controller
    // *** present self with RootViewController
}

@end
