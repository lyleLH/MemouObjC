//
//  MTHomeDataManager.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTHomeDataManager.h"
//#import <FastImageCache/FastImageCache.h>



//@interface MTHomeDataManager ()<FICImageCacheDelegate>
@interface MTHomeDataManager ()

@end


@implementation MTHomeDataManager

- (instancetype)init {
    if(self){
//        // Configure the image cache
//        FICImageCache *sharedImageCache = [FICImageCache sharedImageCache];
//        [sharedImageCache setDelegate:self];
//
//
//        FICImageFormat *smallUserThumbnailImageFormat = [[FICImageFormat alloc] init];
//        smallUserThumbnailImageFormat.name = XXImageFormatNameUserThumbnailSmall;
//        smallUserThumbnailImageFormat.family = XXImageFormatFamilyUserThumbnails;
//        smallUserThumbnailImageFormat.style = FICImageFormatStyle16BitBGR;
//        smallUserThumbnailImageFormat.imageSize = CGSizeMake(kSCREEN_WIDTH, 200);
//        smallUserThumbnailImageFormat.maximumCount = 250;
//        smallUserThumbnailImageFormat.devices = FICImageFormatDevicePhone;
//        smallUserThumbnailImageFormat.protectionMode = FICImageFormatProtectionModeNone;
//
//        FICImageFormat *mediumUserThumbnailImageFormat = [[FICImageFormat alloc] init];
//        mediumUserThumbnailImageFormat.name = XXImageFormatNameUserThumbnailMedium;
//        mediumUserThumbnailImageFormat.family = XXImageFormatFamilyUserThumbnails;
//        mediumUserThumbnailImageFormat.style = FICImageFormatStyle32BitBGRA;
//        mediumUserThumbnailImageFormat.imageSize = CGSizeMake(kSCREEN_WIDTH*3, 600);
//        mediumUserThumbnailImageFormat.maximumCount = 250;
//        mediumUserThumbnailImageFormat.devices = FICImageFormatDevicePhone;
//        mediumUserThumbnailImageFormat.protectionMode = FICImageFormatProtectionModeNone;
//
//        NSArray *imageFormats = @[smallUserThumbnailImageFormat, mediumUserThumbnailImageFormat];
//
//        sharedImageCache.formats = imageFormats;
    }
    return self;
}



//- (void)imageCache:(FICImageCache *)imageCache wantsSourceImageForEntity:(id<FICEntity>)entity withFormatName:(NSString *)formatName completionBlock:(FICImageRequestCompletionBlock)completionBlock {
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//
//        NSURL *filePathURL = [entity sourceImageURLWithFormatName:formatName];
//        UIImage *sourceImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:filePathURL]];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            completionBlock(sourceImage);
//        });
//    });
//}
//
//
//- (BOOL)imageCache:(FICImageCache *)imageCache shouldProcessAllFormatsInFamily:(NSString *)formatFamily forEntity:(id<FICEntity>)entity {
//    return NO;
//}
//
//- (void)imageCache:(FICImageCache *)imageCache errorDidOccurWithMessage:(NSString *)errorMessage {
//    NSLog(@"%@", errorMessage);
//}
//




- (NSArray *)imagesWithAsset:(NSArray< PHAsset*>*)assets {
    NSMutableArray * pureImages = [NSMutableArray new];
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc]init];
//    options.resizeMode = PHImageRequestOptionsResizeModeFast;
    options.synchronous = YES;
    [assets enumerateObjectsUsingBlock:^(PHAsset * _Nonnull asset, NSUInteger idx, BOOL * _Nonnull stop) {
        
        
//        [[PHImageManager defaultManager]requestImageForAsset:obj.asset targetSize:[UIScreen mainScreen].bounds.size contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
//            [pureImages addObject:result];
//        }];
        
        [[PHImageManager defaultManager] requestImageDataForAsset:asset
                                                          options:options
                                                    resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
                                                        if (imageData) {
                                                            UIImage *image = [[UIImage alloc] initWithData:imageData];
                                                            [pureImages addObject:image];
                                                        }
                                                    }];
    }];
    return [NSArray arrayWithArray:pureImages];
    
}


- (NSArray*)imageModesWithImages:(NSArray<UIImage *>*)images {
    NSMutableArray * models = [NSMutableArray new];
    
    [images enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        MTImageCellModel * model = [[MTImageCellModel alloc] init];
        model.image = obj;
        [models addObject:model];
    }];
    self.sortedArray = models;
    return models;
}



- (NSArray<UIImage*>*)imagesWithModelArray:(NSArray*)array {
    NSMutableArray * images = [NSMutableArray new];
    [array enumerateObjectsUsingBlock:^(MTImageCellModel* model, NSUInteger idx, BOOL * _Nonnull stop) {
        [images addObject:model.image];
    }];
    return images;
}




@end
