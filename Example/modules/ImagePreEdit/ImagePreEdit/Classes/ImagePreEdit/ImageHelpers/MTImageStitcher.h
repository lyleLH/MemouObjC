//
//  MTImageStitcher.h
//  Memou
//
//  Created by Tom on 2021/6/23.
//  Copyright © 2021 Tom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTImageStitchDelegate.h"

@class SZImageGenerator;
NS_ASSUME_NONNULL_BEGIN
typedef void(^SZImageMergeBlock)(SZImageGenerator *generator,NSError *error);

@interface MTImageStitcher : NSObject

@property (nonatomic,weak)  id<MTImageStitchDelegate>    delegate;
- (UIImage *)stitchImages:(NSArray*)images resultTargetSize:(CGSize)targetSize ;
- (void)stitchImages:(NSArray*)images;


- (void)mergeImages:(NSArray *)assets
         completion:(SZImageMergeBlock)completion;


@end

NS_ASSUME_NONNULL_END
