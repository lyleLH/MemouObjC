//
//  MTHomeViewController.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <UIKit/UIKit.h>

#import "MTHomeModuleInterface.h"
#import "MTHomeViewInterface.h"

/**
 View controller for the Home module.
 */
@interface MTHomeViewController : UIViewController <MTHomeViewInputInterface>

@property (nonatomic, strong) id<MTHomeViewOutputInterface> eventHandler;

// *** add UI events here

@end
