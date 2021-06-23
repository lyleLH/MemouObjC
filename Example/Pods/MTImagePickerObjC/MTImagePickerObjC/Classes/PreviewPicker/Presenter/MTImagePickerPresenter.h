//
//  MTImagePickerPresenter.h
//  MTImagePicker
//
//  Created by MTTGCC on 10/06/21.
//
//

#import <Foundation/Foundation.h>



#import <MTImagePickerViewInterface.h>
#import <MTImagePickerInteractorProtocol.h>
@class MTImagePickerWireframe;
@class MTImagePickerInteractor;

/**
 Display logic for the MTImagePicker module.
 */
@interface MTImagePickerPresenter : NSObject <MTImagePickerViewOutputInterface>

@property (nonatomic, strong) MTImagePickerInteractor <MTImagePickerInteractorInputProtocol>*interactor;

@property (nonatomic, strong) MTImagePickerWireframe *wireframe;

@property (nonatomic, weak) id <MTImagePickerViewInputInterface> userInterface;

@end
