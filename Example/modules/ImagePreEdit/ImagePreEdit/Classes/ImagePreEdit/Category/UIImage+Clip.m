//
//  UIImage+Clip.m
//  SoSoRun
//
//  Created by 彭作青 on 16/1/27.
//  Copyright © 2016年 SouSouRun. All rights reserved.
//

#import "UIImage+Clip.h"

@implementation UIImage (Clip)

- (UIImage *)clipByRect:(CGRect)rect {
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect newRect = CGRectMake(0, 0, CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
    UIGraphicsBeginImageContext(newRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, newRect, imageRef);
    UIImage *clipImage = [UIImage imageWithCGImage:imageRef];
    UIGraphicsEndImageContext();
    CGImageRelease(imageRef);
    return clipImage;
}




- (void)clipImageWithDrawSize:(CGSize)drawSize borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor completion:(void (^)(UIImage *image))completion {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // borderWidth 表示边框的宽度
        CGFloat imageW = drawSize.width - 2 * borderWidth;
        CGFloat imageH = drawSize.height - 2 * borderWidth;
        UIGraphicsBeginImageContextWithOptions(drawSize, NO, 0.0);
        CGContextRef context = UIGraphicsGetCurrentContext();
        // borderColor表示边框的颜色
        [borderColor set];
        CGFloat bigRadius = drawSize.width * 0.5;
        CGFloat centerX = bigRadius;
        CGFloat centerY = bigRadius;
        CGContextAddArc(context, centerX, centerY, bigRadius, 0, M_PI * 2, 0);
        CGContextFillPath(context);
        CGFloat smallRadius = bigRadius - borderWidth;
        CGContextAddArc(context, centerX, centerY, smallRadius, 0, M_PI * 2, 0);
        CGContextClip(context);
        [self drawInRect:CGRectMake(borderWidth, borderWidth, imageW, imageH)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        // 通过回调返回结果
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(newImage);
            });
        }
    });
}

- (void)clipImageWithDrawSize:(CGSize)drawSize completion:(void (^)(UIImage *image))completion {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CGRect rect = CGRectMake(0, 0, drawSize.width, drawSize.height);
        // 1. 开启图像上下文
        UIGraphicsBeginImageContextWithOptions(drawSize, NO, 0);
        
        // 绘制背景颜色
        [[UIColor clearColor] setFill];
        
        UIRectFill(rect);
        
        // 建立切图路径
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        
        // 添加切图路径 - 之后的绘制结果，只会获得路径包含范围内的结果
        [path addClip];
        
        // 2. 绘制图像
        [self drawInRect:rect];
        
        // 3. 从上下文拿到结果
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        
        // 4. 关闭上下文
        UIGraphicsEndImageContext();
        
        // 5. 通过回调返回结果
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(result);
            });
        }
    });
}

+ (UIImage*)clipWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

- (UIImage *)cutImageWithDrawSize:(CGSize)drawSize cutScale:(CGFloat)cutScale {
    UIGraphicsBeginImageContext(drawSize);
    [[UIColor clearColor] setFill];
    [self drawInRect:CGRectMake(0, -drawSize.height * cutScale, drawSize.width, drawSize.height * (1 + cutScale))];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}




- (UIImage *)fixOrientation {
    if (self.imageOrientation == UIImageOrientationUp) return self;
    CGAffineTransform transform = CGAffineTransformIdentity;
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
              
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
              
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
      
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
              
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
      
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
              
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
      
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}




@end
