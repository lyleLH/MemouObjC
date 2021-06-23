//
//  MTImagePickerInteractorProtocol.h
//  MTImagePicker
//
//  Created by Tom on 2021/6/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MTImagePickerInteractorInputProtocol <NSObject>

- (void)loadAllImages;
- (void)getAllSelectedImages;
- (void)getAllSelectedImageAssets;
- (void)refreshImagesStatesIsSelectedWithIndexPaths:(NSArray <NSIndexPath*>*)indexPaths ;
@end

@protocol MTImagePickerInteractorOutputProtocol <NSObject>

- (void)getImagesPrepared:(NSArray *)imageModels;

- (void)getSelectedImagesPrepared:(NSArray *)images;

- (void)getSelectedImageAssetsPrepared:(NSArray *)images;

@end


NS_ASSUME_NONNULL_END
