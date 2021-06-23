//
//  MTImagePickerInteractor.m
//  MTImagePicker
//
//  Created by MTTGCC on 10/06/21.
//
//

#import "MTImagePickerInteractor.h"
#import "MTImagePickerPresenter.h"
#import "MTImagePickerDataManager.h"

@implementation MTImagePickerInteractor


- (void)loadAllImages {
    [self.presenter getImagesPrepared: [self.dataManager imageModels]] ;
}


- (MTImagePickerDataManager *)dataManager {
    if(!_dataManager){
        _dataManager = [[MTImagePickerDataManager alloc] init];
    }
    return _dataManager;
}


- (void)refreshImagesStatesIsSelectedWithIndexPaths:(NSArray <NSIndexPath*>*)indexPaths {
    [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger row = obj.row;
        MTImageModel *model =   self.dataManager.imageModels[row];
        model.isSelected = ! model.isSelected ;
        if(model.isSelected){
            [self.dataManager.selectedImageModels addObject:model];
        }else{
            if([self.dataManager.selectedImageModels containsObject:model]){
                [self.dataManager.selectedImageModels removeObject:model];
            }
        }
    }];
    [self.presenter getImagesPrepared: [self.dataManager imageModels]] ;
}

- (void)getAllSelectedImages {
    [self.presenter getSelectedImagesPrepared:[self.dataManager selectedImages]] ;
}

- (void)getAllSelectedImageAssets {
    [self.presenter getSelectedImageAssetsPrepared:[self.dataManager selectedImageAssets]] ;
}



@end
