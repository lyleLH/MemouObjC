//
//  MTImagePickerWireframe.h
//  MTImagePicker
//
//  Created by MTTGCC on 10/06/21.
//
//

#import <Foundation/Foundation.h>

#import "MTImagePicker.h"
#import "MTImagePickerPresenter.h"

@class MTImagePickerPresenter;

/**
 Module wireframe for the MTImagePicker module.
 */
@interface MTImagePickerWireframe : NSObject

@property (nonatomic, strong) MTImagePicker *picker;
@property (nonatomic, strong) MTImagePickerPresenter *presenter;

// initialization
- (void)presentSelfFromViewController:(UIViewController *)viewController;
- (void)hideMenu;
@end
