//
//  MTImageCell.h
//  Memou
//
//  Created by Tom on 2021/6/19.
//  Copyright © 2021 Tom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "MTImageCellModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MTImageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

- (void)updateImage:(MTImageCellModel *)model;
 
@end

NS_ASSUME_NONNULL_END
