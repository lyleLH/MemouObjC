//
//  MTImagePreviewCell.h
//  MTImagePicker
//
//  Created by Tom on 2021/6/13.
//

#import <UIKit/UIKit.h>
#import "MTImageModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MTImagePreviewCell : UICollectionViewCell
@property (nonatomic ,strong) UIImageView *photoImageView;

@property (nonatomic,strong) MTImageModel *item;
@end

NS_ASSUME_NONNULL_END
