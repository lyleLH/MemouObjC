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


- (UIImage *)stitchImages:(NSArray*)images resultTargetSize:(CGSize)targetSize {
    //CGSizeMake(kSCREEN_WIDTH, self.tableView.contentSize.height)
    CGFloat offsetY = 0;
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, [UIScreen mainScreen].scale);
    @autoreleasepool {
        for (UIImage *image in images) {
            @autoreleasepool {
                UIImage* rotatedImage = [image rotateToImageOrientation];
            CGFloat scale = rotatedImage.size.width/kSCREEN_WIDTH;
            CGImageRef imageCropRef = CGImageCreateWithImageInRect(rotatedImage.CGImage, CGRectMake(0, 0, rotatedImage.size.width, rotatedImage.size.height * scale));
            UIImage *imageCrop = [UIImage imageWithCGImage:imageCropRef scale:rotatedImage.scale orientation:UIImageOrientationUp];
            CGFloat realHeight = imageCrop.size.height/imageCrop.size.width*kSCREEN_WIDTH;
            [imageCrop drawInRect:CGRectMake(0, offsetY, kSCREEN_WIDTH, realHeight)];
            offsetY += realHeight;
            CGImageRelease(imageCropRef);
            }
        }
    }
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}


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



@end
