//
//  MTImagePickerInteractor.h
//  MTImagePicker
//
//  Created by MTTGCC on 10/06/21.
//
//

#import <Foundation/Foundation.h>
 
#import <MTImagePickerInteractorProtocol.h>
@class MTImagePickerPresenter;
@class MTImagePickerDataManager;
/**
 Business logic for the MTImagePicker module.
 */
@interface MTImagePickerInteractor : NSObject <MTImagePickerInteractorInputProtocol>

@property (nonatomic, weak) MTImagePickerPresenter <MTImagePickerInteractorOutputProtocol>*presenter;
@property (nonatomic, strong) MTImagePickerDataManager *dataManager;

@end
