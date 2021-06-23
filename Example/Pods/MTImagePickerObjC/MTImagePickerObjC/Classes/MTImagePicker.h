//
//  MTImagePicker.h
//  MTImagePicker
//
//  Created by Tom.Liu on 2021/6/10.
//

#import <Foundation/Foundation.h>
#import "MTImagePickerProtocol.h"
NS_ASSUME_NONNULL_BEGIN
 
@interface MTImagePicker : NSObject

@property (nonatomic,weak)id <MTImagePickerProtocol>delegate;
- (void)showImagePickerInViewController:(UIViewController*)vc withDelegate:(id<MTImagePickerProtocol>)delegate;
@end

NS_ASSUME_NONNULL_END
