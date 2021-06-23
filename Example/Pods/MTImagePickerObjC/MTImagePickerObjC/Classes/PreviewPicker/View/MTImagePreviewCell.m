//
//  MTImagePreviewCell.m
//  MTImagePicker
//
//  Created by Tom on 2021/6/13.
//

#import "MTImagePreviewCell.h"
#import <Photos/PHImageManager.h>
#import <MTLayoutUtilityComponent/MTMasConstraintMaker.h>
@interface MTImagePreviewCell ()
@property (nonatomic,strong)UIView *mask;
@end

@implementation MTImagePreviewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.photoImageView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.photoImageView.frame = self.contentView.bounds;
    [self.contentView addSubview:self.mask];
    self.mask.frame = self.contentView.bounds;
}

- (void)setItem:(MTImageModel *)item{
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc]init];
    options.resizeMode = PHImageRequestOptionsResizeModeFast;
    [[PHImageManager defaultManager]requestImageForAsset:item.asset targetSize:[UIScreen mainScreen].bounds.size contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        self.photoImageView.image = result;
    }];
    self.mask .hidden = !item.isSelected;
}

- (UIImageView *)photoImageView{
    if (!_photoImageView) {
        _photoImageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        _photoImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _photoImageView;
}


- (UIView *)mask {
    if(!_mask){
        UIView *mask = [UIView new];
      
        _mask = mask;
        mask.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.6f];
        mask.hidden = YES;
    }
    return _mask;
}
@end
