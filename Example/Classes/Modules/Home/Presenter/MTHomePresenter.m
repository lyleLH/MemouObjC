//
//  MTHomePresenter.m
//  Memou
//
//  Created by Tom.Liu on 19/06/21.
//
//

#import "MTHomePresenter.h"
#import <MTImagePickerObjC/MTImagePickerHeader.h>

@interface MTHomePresenter ()<MTImagePickerProtocol>
@end

@implementation MTHomePresenter

#pragma mark - MTHomeModuleInterface methods

// implement module interface here



-(void)clickToChooseImage {
    [[[MTImagePicker alloc] init] showImagePickerInViewController:self.userInterface withDelegate:self];
}

- (void)startToStitchImages {
    [self.interactor prepareImages];
}

- (void)sortedNewArray:(NSArray *)array {
    [self.interactor saveSortedArray:array[0]];
}

- (void)imagePickerDidselectedImageAssets:(NSArray*) images {
 
    [self.userInterface updateListWithData:[self.interactor requestImageModels:images]];
}

- (void)imagePickerDidselectedImages:(nonnull NSArray *)images {
     
}



- (void)allImagesPrepared:(NSArray<UIImage *>*)images {

    [self.wireframe presentEditInterface];
    [self.editModuleDelegate sortedImages:images];
}

 

@end
