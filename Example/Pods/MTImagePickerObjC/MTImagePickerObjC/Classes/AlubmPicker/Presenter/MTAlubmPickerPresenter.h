//
//  MTAlubmPickerPresenter.h
//  MTImagePicker
//
//  Created by MTTGCC on 15/06/21.
//
//

#import <Foundation/Foundation.h>

#import "MTAlubmPickerModuleInterface.h"

#import "MTAlubmPickerInteractor.h"
#import "MTAlubmPickerWireframe.h"
#import "MTAlubmPickerViewInterface.h"

@class MTAlubmPickerWireframe;
@class MTAlubmPickerInteractor;

/**
 Display logic for the AlubmPicker module.
 */
@interface MTAlubmPickerPresenter : NSObject <MTAlubmPickerModuleInterface>

@property (nonatomic, strong) MTAlubmPickerInteractor *interactor;
@property (nonatomic, weak) MTAlubmPickerWireframe *wireframe;

@property (nonatomic, weak) UIViewController<MTAlubmPickerViewInterface> *userInterface;

@end
