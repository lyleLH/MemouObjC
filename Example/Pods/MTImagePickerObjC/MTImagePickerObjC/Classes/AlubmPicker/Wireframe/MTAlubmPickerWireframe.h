//
//  MTAlubmPickerWireframe.h
//  MTImagePicker
//
//  Created by MTTGCC on 15/06/21.
//
//

#import <Foundation/Foundation.h>

#import "MTImagePickerWireframe.h"
#import "MTAlubmPickerPresenter.h"

@class MTAlubmPickerPresenter;

/**
 Module wireframe for the AlubmPicker module.
 */
@interface MTAlubmPickerWireframe : NSObject

@property (nonatomic, strong) MTImagePickerWireframe *rootWireframe;
@property (nonatomic, strong) MTAlubmPickerPresenter *presenter;

// initialization
- (void)presentSelfFromViewController:(UIViewController *)viewController;

@end
