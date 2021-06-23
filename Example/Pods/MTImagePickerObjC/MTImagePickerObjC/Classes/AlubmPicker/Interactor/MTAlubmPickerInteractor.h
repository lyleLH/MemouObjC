//
//  MTAlubmPickerInteractor.h
//  MTImagePicker
//
//  Created by MTTGCC on 15/06/21.
//
//

#import <Foundation/Foundation.h>

#import "MTAlubmPickerPresenter.h"
#import "MTAlubmPickerDataManager.h"

@class MTAlubmPickerPresenter;

/**
 Business logic for the AlubmPicker module.
 */
@interface MTAlubmPickerInteractor : NSObject

@property (nonatomic, weak) MTAlubmPickerPresenter *presenter;
@property (nonatomic, strong) MTAlubmPickerDataManager *dataManager;

@end
