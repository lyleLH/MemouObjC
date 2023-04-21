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
#import "MTImagePreEditInteractorProtocol.h"
@class MTImagePreEditPresenter;

/**
 Business logic for the ImagePreEdit module.
 */
@interface MTImagePreEditInteractor : NSObject <MTImagePreEditInteractorInputProtocol>

@property (nonatomic, weak) MTImagePreEditPresenter <MTImagePreEditInteractorOutputProtocol>*presenter;
@property (nonatomic, strong) MTImagePreEditDataManager *dataManager;

- (void)preparePreMergeData ;

@end
