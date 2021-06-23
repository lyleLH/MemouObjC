//
//  MTHomeInteractor.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <Foundation/Foundation.h>

#import "MTHomePresenter.h"
#import "MTHomeDataManager.h"
#import "MTHomeInteractorProtocol.h"
@class MTHomePresenter;

/**
 Business logic for the Home module.
 */
@interface MTHomeInteractor : NSObject <MTHomeInteractorInputProtocol>

@property (nonatomic, weak) MTHomePresenter <MTHomeInteractorOutputProtocol>*presenter;
@property (nonatomic, strong) MTHomeDataManager *dataManager;
//@property (nonatomic, weak) MTHomeDataManager *dataManager;
@end
