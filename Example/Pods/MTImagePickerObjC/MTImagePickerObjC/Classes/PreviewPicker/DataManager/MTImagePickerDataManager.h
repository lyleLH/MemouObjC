//
//  MTImagePickerDataManager.h
//  MTImagePicker
//
//  Created by MTTGCC on 10/06/21.
//
//

#import <Foundation/Foundation.h>
#import "MTImageModel.h"

/**
 Data manager for the MTImagePicker module.
 */
@interface MTImagePickerDataManager : NSObject
@property (nonatomic ,strong) NSArray <MTImageModel*>*imageModels;
@property (nonatomic ,strong) NSMutableArray <MTImageModel*>*selectedImageModels;

- (NSArray <UIImage*>*)selectedImages;

- (NSArray <PHAsset*>*)selectedImageAssets;

@end
