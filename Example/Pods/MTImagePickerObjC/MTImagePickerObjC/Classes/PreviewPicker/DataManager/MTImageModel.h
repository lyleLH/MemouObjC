//
//  MTImageModel.h
//  MTImagePicker
//
//  Created by Tom.Liu on 2021/6/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class PHAsset;
@interface MTImageModel : NSObject
@property (nonatomic,readonly)PHAsset *asset;
@property (nonatomic,assign) BOOL isSelected;

- (instancetype)initWithImageAsset:(PHAsset *)asset;

@end

NS_ASSUME_NONNULL_END
