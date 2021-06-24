//
//  MTImageCellModel.h
//  Memou
//
//  Created by Tom.Liu on 2021/6/20.
//  Copyright © 2021 Tom. All rights reserved.
//

#import <Foundation/Foundation.h>
 

NS_ASSUME_NONNULL_BEGIN
 
@interface MTImageCellModel : NSObject
@property (nonatomic, copy) NSString *filename;
@property (nonatomic, strong) UIImage *image;
@end

NS_ASSUME_NONNULL_END
