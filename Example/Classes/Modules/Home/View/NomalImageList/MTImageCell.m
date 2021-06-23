//
//  MTImageCell.m
//  Memou
//
//  Created by Tom on 2021/6/19.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTImageCell.h"


@implementation MTImageCell

- (void)layoutSubviews {
    [super layoutSubviews];

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.to(self.contentView).top(0).left(0).right(0).bottom(5);
//        make.height.equalTo(@(imageH));
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateImage:(MTImageCellModel *)model {

//    UIImage *  image = [newImage fixOrientation];
//    CGFloat imageH = image.size.height/(image.size.width/kSCREEN_WIDTH);
    
//    self.photoImageView.image  = [image clipByRect:CGRectMake(0, (image.size.height/2.0) - ((image.size.height/kSCREEN_HEIGHT) * 100), image.size.width,  (image.size.height/kSCREEN_HEIGHT) * 200)];
    
//    PHImageRequestOptions *options = [[PHImageRequestOptions alloc]init];
//    options.resizeMode = PHImageRequestOptionsResizeModeFast;
//    options.synchronous = YES;
//
//        [[PHImageManager defaultManager]requestImageForAsset:asset targetSize:CGSizeMake(kSCREEN_WIDTH*5, 200*5) contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
//                self.photoImageView.image = result;
//        }];
//
    
//    self.image = [[ORImage alloc] init];
//    self.image.filename = @"pizza";

//    [[FICImageCache sharedImageCache] retrieveImageForEntity:model withFormatName:XXImageFormatNameUserThumbnailMedium completionBlock:^(id<FICEntity> entity, NSString *formatName, UIImage *image) {
//        [self.imageView setImage:image];
//    }];
       

}



@end
