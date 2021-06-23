//
//  MTImageModel.m
//  MTImagePicker
//
//  Created by Tom.Liu on 2021/6/18.
//

#import "MTImageModel.h"
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

@interface MTImageModel ()

@property (nonatomic,strong)PHAsset *asset;
@end

@implementation MTImageModel

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;

}

- (instancetype)initWithImageAsset:(PHAsset *)asset {
    if(self = [super init]){
        _asset = asset;
    }
    return self;
}
 

@end
