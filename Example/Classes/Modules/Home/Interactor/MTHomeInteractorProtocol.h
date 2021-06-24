//
//  MTHomeInteractorProtocol.h
//  Memou
//
//  Created by Tom.Liu on 2021/6/20.
//  Copyright © 2021 Tom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
NS_ASSUME_NONNULL_BEGIN

@protocol MTHomeInteractorOutputProtocol <NSObject>

- (void)allImagesPrepared:(NSArray<UIImage *>*)images;
- (void)imagePicked:(NSArray<PHAsset *>*)assets;
@end

@protocol MTHomeInteractorInputProtocol <NSObject>

- (void)openImagePickerToChooseImage:(NSArray *)images;
- (void)resortImagesWithFromIndexPath:(NSIndexPath*)fromIndexPath andToIndexPath:(NSIndexPath*)toIndexPath;
 
- (void)autoStitchForPrew;

@end


NS_ASSUME_NONNULL_END
