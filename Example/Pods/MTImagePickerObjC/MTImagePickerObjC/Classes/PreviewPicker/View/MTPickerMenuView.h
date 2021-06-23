//
//  MTPickerMenuView.h
//  MTImagePicker
//
//  Created by Tom on 2021/6/13.
//

#import <UIKit/UIKit.h>
#import <MTImagePickerViewInterface.h>
#import <MTImagePickerPresenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface MTPickerMenuView : UIView <MTImagePickerViewInputInterface>
@property (nonatomic,strong) MTImagePickerPresenter *eventHandler;
@end

NS_ASSUME_NONNULL_END
