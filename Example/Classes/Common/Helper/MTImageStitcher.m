//
//  MTImageStitcher.m
//  Memou
//
//  Created by Tom on 2021/6/23.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "MTImageStitcher.h"



@implementation MTImageStitcher

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




@end
