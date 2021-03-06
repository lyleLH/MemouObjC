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
#import "MTImagesPreEditView.h"

/**
 View controller for the ImagePreEdit module.
 */
@interface MTImagePreEditViewController : UIViewController <MTImagePreEditViewInputInterface>

@property (nonatomic, strong) id<MTImagePreEditViewOutputInterface> eventHandler;


// *** add UI events here

@end
