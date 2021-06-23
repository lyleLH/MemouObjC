//
//  MTAlubmPickerViewController.h
//  MTImagePicker
//
//  Created by MTTGCC on 15/06/21.
//
//

#import <UIKit/UIKit.h>

#import "MTAlubmPickerModuleInterface.h"
#import "MTAlubmPickerViewInterface.h"

/**
 View controller for the AlubmPicker module.
 */
@interface MTAlubmPickerViewController : UIViewController <MTAlubmPickerViewInterface>

@property (nonatomic, strong) id<MTAlubmPickerModuleInterface> eventHandler;

// *** add UI events here

@end
