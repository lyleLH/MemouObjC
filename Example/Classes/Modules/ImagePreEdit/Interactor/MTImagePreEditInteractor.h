//
//  MTImagePreEditInteractor.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <Foundation/Foundation.h>

#import "MTImagePreEditPresenter.h"
#import "MTImagePreEditDataManager.h"

@class MTImagePreEditPresenter;

/**
 Business logic for the ImagePreEdit module.
 */
@interface MTImagePreEditInteractor : NSObject

@property (nonatomic, weak) MTImagePreEditPresenter *presenter;
@property (nonatomic, strong) MTImagePreEditDataManager *dataManager;

@end
