//
//  MTHomePresenter.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <Foundation/Foundation.h>

#import "MTHomeModuleInterface.h"

#import "MTHomeInteractor.h"
#import "MTHomeWireframe.h"
#import "MTHomeViewInterface.h"

@class MTHomeWireframe;
@class MTHomeInteractor;

/**
 Display logic for the Home module.
 */
@interface MTHomePresenter : NSObject <MTHomeViewOutputInterface>

@property (nonatomic, strong) MTHomeInteractor *interactor;
@property (nonatomic, weak) MTHomeWireframe *wireframe;

@property (nonatomic, weak) UIViewController<MTHomeViewInputInterface> *userInterface;

@end
