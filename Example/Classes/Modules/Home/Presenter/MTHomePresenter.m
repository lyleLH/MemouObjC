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
    [self.interactor preparedImages];
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
//    NSArray * imageArray =@[[UIImage imageNamed:@"pano_19_16_mid"],
//                        [UIImage imageNamed:@"pano_19_20_mid"],
//                        [UIImage imageNamed:@"pano_19_22_mid"],
//                        [UIImage imageNamed:@"pano_19_25_mid"]];
    
    
//    UIImageView * imageView= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, kSCREEN_HEIGHT)];
//    imageView.image = image;
//
//    [[UIApplication sharedApplication].delegate.window addSubview:imageView];
    
}



@end
