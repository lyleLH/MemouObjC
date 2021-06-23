//
//  MTImagePickerPresenter.m
//  MTImagePicker
//
//  Created by MTTGCC on 10/06/21.
//
//

#import "MTImagePickerPresenter.h"
#import "MTImagePickerInteractor.h"
#import "MTImagePickerWireframe.h"

@interface MTImagePickerPresenter ()<MTImagePickerInteractorOutputProtocol>

@end

@implementation MTImagePickerPresenter

#pragma mark -- MTImagePickerViewOutputInterface

- (void)setUpViews {
    [self.interactor loadAllImages];
   
}

- (void)previewCollectionViewDidselected:(NSIndexPath *)indexPath {
    [self.interactor refreshImagesStatesIsSelectedWithIndexPaths:@[indexPath]];
   
}

- (void)menuTableViewViewDidselected:(NSIndexPath*)indexPath  {
    [self.interactor getAllSelectedImageAssets];
}
 
#pragma mark -- MTImagePickerInteractorOutputProtocol

-(void)getImagesPrepared:(NSArray *)imageModels {
    [self.userInterface reloadViewContent:imageModels];
}

-(void)getSelectedImagesPrepared:(NSArray *)images {
    
    [self.wireframe.picker.delegate imagePickerDidselectedImages:images];
}

- (void)getSelectedImageAssetsPrepared:(NSArray *)images {
    [self.wireframe hideMenu];
    [self.wireframe.picker.delegate imagePickerDidselectedImageAssets:images];
}


- (MTImagePickerInteractor<MTImagePickerInteractorInputProtocol> *)interactor {
    if(!_interactor){
        MTImagePickerInteractor* interactor = [[MTImagePickerInteractor alloc] init];
        interactor.presenter = self;
        _interactor = interactor;
    }
    return _interactor;
}


@end
