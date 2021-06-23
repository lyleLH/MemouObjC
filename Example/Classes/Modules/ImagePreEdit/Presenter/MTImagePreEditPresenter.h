//
//  MTImagePreEditPresenter.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <Foundation/Foundation.h>

#import "MTImagePreEditModuleInterface.h"

#import "MTImagePreEditInteractor.h"
#import "MTImagePreEditWireframe.h"
#import "MTImagePreEditViewInterface.h"
#import "MTImagePreEditInteractorProtocol.h"
@class MTImagePreEditWireframe;
@class MTImagePreEditInteractor;

/**
 Display logic for the ImagePreEdit module.
 */
@interface MTImagePreEditPresenter : NSObject <MTImagePreEditViewOutputInterface,MTImagePreEditModuleDelegate,MTImagePreEditInteractorOutputProtocol>

@property (nonatomic, strong) MTImagePreEditInteractor <MTImagePreEditInteractorInputProtocol>*interactor;
@property (nonatomic, weak) MTImagePreEditWireframe *wireframe;

@property (nonatomic, weak) UIViewController<MTImagePreEditViewInputInterface> *userInterface;

@end
