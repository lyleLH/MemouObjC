//
//  MTImageStitcher.m
//  Memou
//
//  Created by Tom on 2021/6/23.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTImageStitcher.h"
#import "SZImageGenerator.h"
#import "SZMergeResult.h"
#import <Photos/Photos.h>
@interface MTImageStitcher ()
@property (nonatomic,strong) dispatch_queue_t queue;
@end

@implementation MTImageStitcher

- (instancetype)init {
    if(self ==[super init]){
        _queue = dispatch_queue_create("com.lyle.image.queue", 0);
    }
    return self;
}

#pragma mark - 合并图片
- (void)mergeImages:(NSArray *)assets
         completion:(SZImageMergeBlock)completion
{
    if ([self.delegate respondsToSelector:@selector(mergeBegin)]) {
        [self.delegate mergeBegin];
    }
    
    dispatch_async(_queue, ^{
        CFAbsoluteTime time = CFAbsoluteTimeGetCurrent();
        SZImageGenerator *generator = [self imageGeneratorBy:assets];
        if (!generator) {
            return ;
        }
        NSError *error = [generator error];
        CFAbsoluteTime nextTime = CFAbsoluteTimeGetCurrent() - time;
        NSLog(@"合并时间%@",@(nextTime));
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([self.delegate respondsToSelector:@selector(mergeEnd)]) {
                [self.delegate mergeEnd];
            }
            
            if (completion) {
                generator.stiching = NO;
                completion(generator,error);
            }
        });
    });
}



//
//- (UIImage *)stitchImages:(NSArray*)images resultTargetSize:(CGSize)targetSize {
//    //CGSizeMake(kSCREEN_WIDTH, self.tableView.contentSize.height)
//    CGFloat offsetY = 0;
//    UIGraphicsBeginImageContextWithOptions(targetSize, NO, [UIScreen mainScreen].scale);
//    @autoreleasepool {
//        for (UIImage *image in images) {
//            @autoreleasepool {
//                UIImage* rotatedImage = [image rotateToImageOrientation];
//            CGFloat scale = rotatedImage.size.width/kSCREEN_WIDTH;
//            CGImageRef imageCropRef = CGImageCreateWithImageInRect(rotatedImage.CGImage, CGRectMake(0, 0, rotatedImage.size.width, rotatedImage.size.height * scale));
//            UIImage *imageCrop = [UIImage imageWithCGImage:imageCropRef scale:rotatedImage.scale orientation:UIImageOrientationUp];
//            CGFloat realHeight = imageCrop.size.height/imageCrop.size.width*kSCREEN_WIDTH;
//            [imageCrop drawInRect:CGRectMake(0, offsetY, kSCREEN_WIDTH, realHeight)];
//            offsetY += realHeight;
//            CGImageRelease(imageCropRef);
//            }
//        }
//    }
//    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return resultImage;
//}


- (void)stitchImages:(NSArray*)images {
    if(self.delegate &&[self.delegate respondsToSelector:@selector(mergeBegin)]){
        [self.delegate mergeBegin];
    }
    
    dispatch_async(_queue, ^{
        
        SZImageGenerator *generator = [self imageGeneratorByImages:images];
        UIImage *image = [generator generate];
        NSError *error = [generator error];
        
        SZMergeResult *result = [SZMergeResult resultBy:image
                                                  error:error];
        
        if(self.delegate &&[self.delegate respondsToSelector:@selector(showResult:)]){
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate showResult:result];
            });
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(self.delegate &&[self.delegate respondsToSelector:@selector(mergeEnd)]){
                [self.delegate mergeEnd];
            }
            
            
        });
    });
    
    
}


- (SZImageGenerator *)imageGeneratorByImages:(NSArray *)images
{
    SZImageGenerator *generator = [[SZImageGenerator alloc] init];
    [images enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [generator feedImage:obj];
    }];
    return generator;
}

/*
 * @description assets数组生成获取图片
 */
- (SZImageGenerator *)imageGeneratorBy:(NSArray *)assets
{
    NSMutableArray<UIImage *> *images = [NSMutableArray new];
    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
    options.synchronous = YES;
    [assets enumerateObjectsUsingBlock:^(id  _Nonnull asset, NSUInteger idx, BOOL * _Nonnull stop) {
        [[PHImageManager defaultManager] requestImageDataForAsset:asset
                                                          options:options
                                                    resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
            if (imageData) {
                UIImage *image = [[UIImage alloc] initWithData:imageData];
                [images addObject:image];
            }
        }];
    }];
    
    
    if (!images.count) {
        return nil;
    }
    
    SZImageGenerator *generator = [[SZImageGenerator alloc] init];
//    PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
//    options.synchronous = YES;
    CFAbsoluteTime time = CFAbsoluteTimeGetCurrent();
    for (UIImage *image in images)
    {
        [generator feedImage:image];
    }
    
    CFAbsoluteTime next = CFAbsoluteTimeGetCurrent() - time;
    NSLog(@"总共消耗的时间：%@",@(next));
    return generator;
}



@end
