//
//  MTHomeInteractor.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTHomeInteractor.h"
#import <MTImagePickerObjC/MTImagePickerHeader.h>
#import "MTImageStitcher.h"
@interface MTHomeInteractor ()<MTImagePickerProtocol>
@property (nonatomic,strong) MTImageStitcher * stitcher ;
@end


@implementation MTHomeInteractor


#pragma mark -- MTImagePickerProtocol

- (void)imagePickerDidselectedImageAssets:(NSArray*) images {
    [self.dataManager setAssets:[NSMutableArray arrayWithArray:images]];
    [self.presenter imagePicked:[self.dataManager imageModesWithImages:[self.dataManager imagesWithAsset:images]]];
}

 

#pragma mark -- MTHomeInteractorInputProtocol
-(void)openImagePickerToChooseImage:(NSArray *)images {
    [[[MTImagePicker alloc] init] showImagePickerInViewController:self.presenter.userInterface withDelegate:self];
}

 
- (void)resortImagesWithFromIndexPath:(NSIndexPath *)fromIndexPath andToIndexPath:(NSIndexPath *)toIndexPath{
    [self.dataManager.assets exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
}

- (void)autoStitchForPrew {
    [self.stitcher mergeImages:self.dataManager.assets completion:^(SZImageGenerator * _Nonnull generator, NSError * _Nonnull error) {
            
    }];
}

- (void)func1 {
    
}

- (void)func2 {
    
}


- (MTImageStitcher *)stitcher {
    if(!_stitcher){
        _stitcher = [[MTImageStitcher alloc] init];
    }
    return _stitcher;
}
@end
