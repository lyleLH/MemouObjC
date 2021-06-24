//
//  MTHomeDataManager.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTHomeDataManager.h"

@interface MTHomeDataManager ()

@end


@implementation MTHomeDataManager

- (instancetype)init {
    if(self){

    }
    return self;
}




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
    return models;
}



- (NSArray<UIImage*>*)imagesWithModelArray:(NSArray*)array {
    NSMutableArray * images = [NSMutableArray new];
    [array enumerateObjectsUsingBlock:^(MTImageCellModel* model, NSUInteger idx, BOOL * _Nonnull stop) {
        [images addObject:model.image];
    }];
    return images;
}

- (NSMutableArray *)assets {
    if(!_assets){
        _assets = [NSMutableArray new];
    }
    return _assets;
}


@end
