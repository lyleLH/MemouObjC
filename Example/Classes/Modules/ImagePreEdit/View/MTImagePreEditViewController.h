//
//  MTImagePreEditViewController.h
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import <UIKit/UIKit.h>

#import "MTImagePreEditModuleInterface.h"
#import "MTImagePreEditViewInterface.h"

/**
 View controller for the ImagePreEdit module.
 */
@interface MTImagePreEditViewController : UIViewController <MTImagePreEditViewInterface>

@property (nonatomic, strong) id<MTImagePreEditModuleInterface> eventHandler;

// *** add UI events here

@end
