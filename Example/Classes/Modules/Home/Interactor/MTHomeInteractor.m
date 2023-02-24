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



- (void)func1 {
    
}

- (void)func2 {
    
}


@end
