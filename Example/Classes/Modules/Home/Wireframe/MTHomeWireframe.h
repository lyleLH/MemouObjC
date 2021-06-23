//
//  MTHomeWireframe.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <Foundation/Foundation.h>

#import "MTRootWireframe.h"
#import "MTHomePresenter.h"

@class MTHomePresenter;
@class MTImagePreEditWireframe;
/**
 Module wireframe for the Home module.
 */
@interface MTHomeWireframe : NSObject

@property (nonatomic, strong) MTRootWireframe *rootWireframe;
@property (nonatomic, strong) MTHomePresenter *presenter;
@property (nonatomic, strong) MTImagePreEditWireframe *editWireframe;
// initialization
- (void)presentSelfFromViewController:(UIViewController *)viewController;

- (void)presentSelfFromWindow:(UIWindow *)window ;
- (void)presentEditInterface;
@end
