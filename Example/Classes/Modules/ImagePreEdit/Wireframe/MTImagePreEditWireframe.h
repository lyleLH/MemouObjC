//
//  MTImagePreEditWireframe.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <Foundation/Foundation.h>

//#import "RootWireframe.h"
#import "MTImagePreEditPresenter.h"

@class MTImagePreEditPresenter;

/**
 Module wireframe for the ImagePreEdit module.
 */
@interface MTImagePreEditWireframe : NSObject

//@property (nonatomic, strong) RootWireframe *rootWireframe;
@property (nonatomic, strong) MTImagePreEditPresenter *presenter;

// initialization
- (void)presentSelfFromViewController:(UIViewController *)viewController;

@end
